/**
 * =========================================================================
 * KAU EVENTOS & FESTAS - MÓDULO DE SINCRONIZAÇÃO E FIREBASE
 * =========================================================================
 * Este módulo gerencia a comunicação em nuvem com o Firebase:
 * - Cloud Firestore (catálogo de produtos e configurações do site)
 * - Cloud Storage (upload de imagens em alta resolução)
 * - Firebase Authentication (login seguro com Email e Senha)
 * 
 * DESIGN RESILIENTE (MODO HÍBRIDO):
 * Se o Firebase ainda não estiver configurado pelo Administrador, o sistema
 * funciona 100% em modo LocalStorage (sem travar nem gerar erros).
 * Assim que as chaves forem preenchidas no Painel Admin, a sincronização
 * em nuvem passa a operar automaticamente em tempo real!
 * =========================================================================
 */

(function(window) {
  'use strict';

  const STORAGE_KEY_CONFIG = 'kau_firebase_config';
  const STORAGE_KEY_PRODUCTS = 'kau_products';
  const STORAGE_KEY_SETTINGS = 'kau_site_settings';
  const STORAGE_KEY_AUTH = 'kau_admin_auth';

  let firebaseInitialized = false;
  let db = null;
  let storage = null;
  let auth = null;

  // Configuração global compartilhada do Firebase (acessível para todos os celulares e visitantes na web)
  // Caso deseje conectar a nuvem para todos os celulares sem precisar digitar em cada um, preencha este objeto abaixo:
  window.KAU_FIREBASE_DEFAULT_CONFIG = window.KAU_FIREBASE_DEFAULT_CONFIG || null;

  // Recupera as configurações salvas do Firebase
  function getFirebaseConfig() {
    // 1. Configuração global compartilhada no código (funciona para qualquer celular ou visitante)
    if (window.KAU_FIREBASE_DEFAULT_CONFIG && window.KAU_FIREBASE_DEFAULT_CONFIG.apiKey && window.KAU_FIREBASE_DEFAULT_CONFIG.projectId) {
      return window.KAU_FIREBASE_DEFAULT_CONFIG;
    }
    // 2. Configuração local deste navegador (LocalStorage)
    try {
      const data = localStorage.getItem(STORAGE_KEY_CONFIG);
      if (data) {
        return JSON.parse(data);
      }
    } catch (e) {
      console.warn('Erro ao carregar config do Firebase:', e);
    }
    return null;
  }

  // Salva as configurações do Firebase no navegador
  function saveFirebaseConfig(configObj) {
    if (!configObj) {
      localStorage.removeItem(STORAGE_KEY_CONFIG);
      firebaseInitialized = false;
      return;
    }
    localStorage.setItem(STORAGE_KEY_CONFIG, JSON.stringify(configObj));
    return initFirebase();
  }

  // Verifica se o Firebase está configurado com chaves mínimas válidas
  function isFirebaseConfigured() {
    const cfg = getFirebaseConfig();
    return !!(cfg && cfg.apiKey && cfg.projectId);
  }

  // Inicializa o Firebase
  function initFirebase() {
    if (typeof firebase === 'undefined') {
      console.info('SDK do Firebase não detectado ou ainda carregando.');
      return false;
    }

    const cfg = getFirebaseConfig();
    if (!cfg || !cfg.apiKey || !cfg.projectId) {
      return false;
    }

    try {
      if (!firebase.apps || !firebase.apps.length) {
        firebase.initializeApp(cfg);
      }
      db = firebase.firestore();
      
      // Habilita persistência offline se possível
      try {
        db.enablePersistence({ synchronizeTabs: true }).catch(() => {});
      } catch (e) {}

      if (firebase.storage) {
        storage = firebase.storage();
      }
      if (firebase.auth) {
        auth = firebase.auth();
      }

      firebaseInitialized = true;
      console.log('✅ Firebase inicializado com sucesso para o projeto:', cfg.projectId);
      return true;
    } catch (err) {
      console.error('Falha ao inicializar Firebase:', err);
      firebaseInitialized = false;
      return false;
    }
  }

  // Tenta inicializar logo no carregamento
  if (typeof window !== 'undefined') {
    window.addEventListener('DOMContentLoaded', () => {
      initFirebase();
    });
  }

  // API do KauFirebase
  window.KauFirebase = {
    getConfig: getFirebaseConfig,
    saveConfig: saveFirebaseConfig,
    isConfigured: isFirebaseConfigured,
    init: initFirebase,

    // Status atual
    getStatus: function() {
      return {
        configured: isFirebaseConfigured(),
        initialized: firebaseInitialized,
        hasFirestore: !!db,
        hasStorage: !!storage,
        hasAuth: !!auth,
        projectId: getFirebaseConfig()?.projectId || null
      };
    },

    // Buscar produtos (Nuvem com fallback para LocalStorage)
    fetchProducts: async function(defaultFallback = []) {
      if (isFirebaseConfigured() && (!firebaseInitialized || !db)) {
        initFirebase();
      }

      if (db) {
        try {
          const docRef = db.collection('site_data').doc('catalog');
          const snap = await docRef.get();
          if (snap.exists && snap.data() && Array.isArray(snap.data().products)) {
            const cloudProds = snap.data().products;
            // Atualiza cache local
            localStorage.setItem(STORAGE_KEY_PRODUCTS, JSON.stringify(cloudProds));
            return cloudProds;
          }
        } catch (e) {
          console.warn('Falha ao buscar produtos do Firebase Firestore, usando cache local:', e);
        }
      }

      // Fallback para LocalStorage
      try {
        const local = localStorage.getItem(STORAGE_KEY_PRODUCTS);
        if (local) return JSON.parse(local);
      } catch (e) {}

      return defaultFallback;
    },

    // Salvar produtos (Nuvem e LocalStorage sincronizados)
    saveProducts: async function(productsArray) {
      // Sempre garante salvar localmente primeiro
      localStorage.setItem(STORAGE_KEY_PRODUCTS, JSON.stringify(productsArray));

      if (isFirebaseConfigured() && (!firebaseInitialized || !db)) {
        initFirebase();
      }

      if (db) {
        try {
          await db.collection('site_data').doc('catalog').set({
            products: productsArray,
            updatedAt: firebase.firestore.FieldValue.serverTimestamp(),
            totalItems: productsArray.length
          });
          return { success: true, mode: 'cloud' };
        } catch (err) {
          console.error('Erro ao sincronizar produtos com Firestore:', err);
          return { success: false, mode: 'local_only', error: err };
        }
      }

      return { success: true, mode: 'local_only' };
    },

    // Buscar configurações de textos do site
    fetchSettings: async function(defaultSettings = {}) {
      if (isFirebaseConfigured() && (!firebaseInitialized || !db)) {
        initFirebase();
      }

      if (db) {
        try {
          const docRef = db.collection('site_data').doc('settings');
          const snap = await docRef.get();
          if (snap.exists && snap.data()) {
            const cloudSettings = snap.data();
            localStorage.setItem(STORAGE_KEY_SETTINGS, JSON.stringify(cloudSettings));
            return Object.assign({}, defaultSettings, cloudSettings);
          }
        } catch (e) {
          console.warn('Falha ao buscar configurações do Firestore, usando locais:', e);
        }
      }

      try {
        const local = localStorage.getItem(STORAGE_KEY_SETTINGS);
        if (local) return Object.assign({}, defaultSettings, JSON.parse(local));
      } catch (e) {}

      return defaultSettings;
    },

    // Salvar configurações de textos do site
    saveSettings: async function(settingsObj) {
      localStorage.setItem(STORAGE_KEY_SETTINGS, JSON.stringify(settingsObj));

      if (isFirebaseConfigured() && (!firebaseInitialized || !db)) {
        initFirebase();
      }

      if (db) {
        try {
          await db.collection('site_data').doc('settings').set(Object.assign({}, settingsObj, {
            updatedAt: firebase.firestore.FieldValue.serverTimestamp()
          }));
          return { success: true, mode: 'cloud' };
        } catch (err) {
          console.error('Erro ao salvar settings no Firestore:', err);
          return { success: false, mode: 'local_only', error: err };
        }
      }

      return { success: true, mode: 'local_only' };
    },

    // Upload de imagem: Se o Firebase Storage estiver ativo, envia para a nuvem e retorna URL pública.
    // Caso contrário, comprime para Base64 WebP/JPEG otimizada para armazenamento local seguro.
    uploadImage: async function(file, filenamePrefix = 'produto') {
      if (isFirebaseConfigured() && (!firebaseInitialized || !storage)) {
        initFirebase();
      }

      // Se temos Firebase Storage ativo
      if (storage) {
        try {
          const cleanName = file.name.replace(/[^a-zA-Z0-9._-]/g, '_');
          const fullPath = `catalog/${filenamePrefix}_${Date.now()}_${cleanName}`;
          const storageRef = storage.ref().child(fullPath);
          const uploadTask = await storageRef.put(file);
          const downloadUrl = await uploadTask.ref.getDownloadURL();
          return { success: true, url: downloadUrl, mode: 'storage' };
        } catch (err) {
          console.warn('Erro ao fazer upload no Firebase Storage, fazendo fallback para Base64:', err);
        }
      }

      // Fallback: Converte imagem para Base64 otimizada com canvas
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onload = function(evt) {
          const img = new Image();
          img.onload = function() {
            try {
              const canvas = document.createElement('canvas');
              const maxDim = 900;
              let width = img.width;
              let height = img.height;

              if (width > maxDim || height > maxDim) {
                if (width > height) {
                  height = Math.round((height * maxDim) / width);
                  width = maxDim;
                } else {
                  width = Math.round((width * maxDim) / height);
                  height = maxDim;
                }
              }

              canvas.width = width;
              canvas.height = height;
              const ctx = canvas.getContext('2d');
              ctx.drawImage(img, 0, 0, width, height);

              const base64Data = canvas.toDataURL('image/jpeg', 0.85);
              resolve({ success: true, url: base64Data, mode: 'base64' });
            } catch (canvasErr) {
              resolve({ success: true, url: evt.target.result, mode: 'base64_raw' });
            }
          };
          img.onerror = () => resolve({ success: true, url: evt.target.result, mode: 'base64_raw' });
          img.src = evt.target.result;
        };
        reader.onerror = (e) => reject(e);
        reader.readAsDataURL(file);
      });
    },

    // Autenticação de Admin (Firebase Auth com fallback local)
    login: async function(userOrEmail, password) {
      if (isFirebaseConfigured() && (!firebaseInitialized || !auth)) {
        initFirebase();
      }

      // Se temos Firebase Auth e parece ser um email
      if (auth && userOrEmail.includes('@')) {
        try {
          const cred = await auth.signInWithEmailAndPassword(userOrEmail, password);
          return { success: true, mode: 'firebase_auth', user: cred.user };
        } catch (err) {
          console.warn('Login com Firebase falhou:', err.code, err.message);
          // Se o erro for senha incorreta ou usuário inexistente no Firebase,
          // ainda verificamos a chave mestre local
        }
      }

      // Fallback para credenciais salvas no LocalStorage ou padrão
      let localCreds = { user: 'admin', pass: 'kau123' };
      try {
        const stored = localStorage.getItem(STORAGE_KEY_AUTH);
        if (stored) localCreds = JSON.parse(stored);
      } catch (e) {}

      if (userOrEmail === localCreds.user && password === localCreds.pass) {
        return { success: true, mode: 'local_master', user: { email: localCreds.user } };
      }

      return { success: false, error: 'Credenciais inválidas' };
    },

    // Logout
    logout: async function() {
      if (auth) {
        try {
          await auth.signOut();
        } catch (e) {}
      }
      sessionStorage.removeItem('kau_logged_in');
      localStorage.removeItem('kau_logged_in');
    },

    // Gestão de Credenciais
    updateCredentials: function(newUser, newPass) {
      if (!newUser || !newPass) return false;
      localStorage.setItem(STORAGE_KEY_AUTH, JSON.stringify({ user: newUser, pass: newPass }));
      return true;
    },
    getCredentials: function() {
      let localCreds = { user: 'admin', pass: 'kau123' };
      try {
        const stored = localStorage.getItem(STORAGE_KEY_AUTH);
        if (stored) localCreds = JSON.parse(stored);
      } catch (e) {}
      return localCreds;
    }
  };

})(window);
