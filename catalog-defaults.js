/**
 * =========================================================================
 * KAU FESTAS - CATÁLOGO E CONFIGURAÇÕES PADRÃO OFICIAIS
 * =========================================================================
 * Fonte única da verdade para os itens padrão de doces, salgados,
 * decorações, kits festa e locação de brinquedos.
 * =========================================================================
 */

(function(window) {
  'use strict';

  window.KAU_DEFAULT_PRODUCTS = [
    // -----------------------------------------------------------------------
    // 1. DOCES ARTESANAIS
    // -----------------------------------------------------------------------
    {
      id: 'doce-cascone',
      name: 'Cascone Artesanal Recheado',
      category: 'doces',
      price: 'A partir de R$ 12,00',
      sizes: '+25 opções de recheios gourmet',
      description: 'Casquinha crocante banhada no chocolate nobre e recheada com mais de 25 opções de sabores artesanais: Clássicos, Frutados, Nutella & Chocolates Famosos e Especiais Pistache e Morango.',
      badge: 'Mais Vendido',
      image: 'doce_cascone.jpg',
      active: true
    },
    {
      id: 'doce-brigadeiro-box',
      name: 'Caixinha de Brigadeiros Artesanais (4 unid)',
      category: 'doces',
      price: 'R$ 12,00',
      sizes: 'Caixinha presenteável c/ 4 brigadeiros',
      description: 'Brigadeiros feitos artesanalmente com textura aveludada e confeitos selecionados: Tradicional nobre, M&M\'s, Castanha/Amendoim, Ninho, Bicho de Pé e Paçoca crocante.',
      badge: 'Destaque',
      image: 'doce_caixinha_brigadeiro.jpg',
      active: true
    },
    {
      id: 'doce-premium-box',
      name: 'Caixinha Seleção Premium (4 unid)',
      category: 'doces',
      price: 'R$ 15,00',
      sizes: '4 doces finos artesanais com acabamento dourado',
      description: 'Experiência gourmet refinada: Flor Esculpida com pérola dourada, Crocante com Ganache de castanhas, Branco Nobre e Explosão Crocante.',
      badge: 'Gourmet',
      image: 'doce_caixinha_premium.jpg',
      active: true
    },
    {
      id: 'doce-pasta-americana',
      name: 'Doces Finos em Pasta Americana',
      category: 'doces',
      price: 'R$ 13,00 a R$ 15,00 / un',
      sizes: 'Modelagem 100% personalizada no tema da sua festa',
      description: 'Pão de Mel Personalizado (R$ 15,00), Cone Trufado Esculpido 3D (R$ 15,00) e Maçã Banhada no Chocolate com laço (R$ 13,00). Modelamos qualquer tema (Safari, Circo, Princesas, etc.).',
      badge: 'Personalizado',
      image: 'doce_pasta_americana.jpg',
      active: true
    },
    {
      id: 'doce-casamento-50',
      name: 'Caixa Seleção Festa & Casamento (50 Doces)',
      category: 'doces',
      price: 'A partir de R$ 140,00 (R$ 2,80 / un)',
      sizes: 'Caixa com 50 doces finos decorados',
      description: '30x Corações de Chocolate com Alianças Douradas, 5x Flores Esculpidas com Pérola, 5x Rosas em Chocolate Branco, 5x Surpresas de Uva Thompson e 5x Brigadeiros Gourmet.',
      badge: 'Especialidade',
      image: 'doce_caixa_casamento.jpg',
      active: true
    },
    {
      id: 'doce-bolo-chocolatudo',
      name: 'Bolo Artesanal Chocolatudo Gourmet',
      category: 'doces',
      price: 'A partir de R$ 90,00 / kg',
      sizes: 'A partir de 1 kg (rende 8 a 10 fatias/kg)',
      description: 'Massa molhadinha de cacau, recheio farto de brigadeiro nobre, granulados tipo split nas laterais e coroado com 3 brigadeiros artesanais grandes no topo. Acompanha base protetora.',
      badge: 'Mais Pedido',
      image: 'doce_bolo_chocolatudo.jpg',
      active: true
    },
    {
      id: 'doce-bolo-pote',
      name: 'Bolo no Pote Artesanal & Cremoso',
      category: 'doces',
      price: 'R$ 15,00 a R$ 20,00',
      sizes: 'Embalagem individual lacrada de 250ml',
      description: 'Camadas generosas de massa macia e recheio aveludado: Tradicional Brigadeiro (R$ 15), Prestígio Branco de Coco (R$ 15) e Duo Supremo com Nutella pura (R$ 20).',
      badge: 'Sobremesa',
      image: 'doce_bolo_pote.jpg',
      active: true
    },

    // -----------------------------------------------------------------------
    // 2. SALGADOS & TORTAS (FRITOS, ASSADOS E TORTINHAS)
    // -----------------------------------------------------------------------
    {
      id: 'salgado-1',
      name: 'Cento de Salgados Fritos Tradicionais',
      category: 'salgados',
      price: 'R$ 90,00 / cento',
      sizes: '100 unidades (10g a 20g cada)',
      description: 'Coxinhas crocantes de frango desfiado, Bolinhas de queijo cremosas com orégano, Kibe recheado artesanal e Risoles de presunto e queijo fritos na hora do seu evento.',
      badge: 'Mais Vendido',
      image: 'cardapio.jpg',
      active: true
    },
    {
      id: 'salgado-2',
      name: 'Cento de Salgados Assados & Folhados',
      category: 'salgados',
      price: 'R$ 115,00 / cento',
      sizes: '100 unidades assadas na hora',
      description: 'Mini esfihas abertas e fechadas de carne nobre, empadinhas cremosas de palmito e frango, e folhadinhos delicados de peito de peru com ricota.',
      badge: 'Especialidade',
      image: 'cardapio.jpg',
      active: true
    },
    {
      id: 'salgado-3',
      name: 'Kit Salgados Festa Mista (Fritos & Assados)',
      category: 'salgados',
      price: 'A partir de R$ 95,00 / cento',
      sizes: 'Mix com 4 sabores à sua escolha',
      description: 'Monte sua combinação ideal entre opções fritas e assadas. Produzidos com massa leve, sem excesso de gordura e entregues quentinhos para a sua festa.',
      badge: 'Favorito',
      image: 'cardapio.jpg',
      active: true
    },
    {
      id: 'doce-tortinhas',
      name: 'Mini Tortinhas Artesanais (Cento ou Meio Cento)',
      category: 'salgados',
      price: 'Cento R$ 170,00 | Meio Cento R$ 80,00',
      sizes: 'Massa crocante amanteigada que derrete na boca',
      description: 'Minitortinhas artesanais com cremes aveludados nos sabores: Limão Fresco com raspas e Maracujá com geleia natural e sementes crocantes. Ideais para aniversários e casamentos.',
      badge: 'Novidade',
      image: 'doce_mini_tortinhas.jpg',
      active: true
    },

    // -----------------------------------------------------------------------
    // 3. DECORAÇÕES TEMÁTICAS & KITS FESTA
    // -----------------------------------------------------------------------
    {
      id: 'festa-kit-p',
      name: 'Kit Festa P (Até 10 pessoas)',
      category: 'decoracoes',
      price: 'R$ 195,00',
      sizes: '1 kg Bolo + 50 Docinhos + 100 Salgados',
      description: 'Ideal para celebrações intimistas e familiares. Inclui 1 kg de bolo confeitado recheado, 50 docinhos de 10g e 100 salgadinhos de festa fresquinhos.',
      badge: 'Econômico',
      image: 'kit_festa_p.jpg',
      active: true
    },
    {
      id: 'festa-kit-m',
      name: 'Kit Festa M (15 a 20 pessoas)',
      category: 'decoracoes',
      price: 'R$ 310,00',
      sizes: '2 kg Bolo + 100 Docinhos + 100 Salgados',
      description: 'O tamanho mais pedido para comemorações! Inclui 2 kg de bolo artesanal recheado, 100 docinhos de 10g e 100 salgados fritos/assados.',
      badge: 'Mais Vendido',
      image: 'kit_festa_m.jpg',
      active: true
    },
    {
      id: 'festa-kit-g',
      name: 'Kit Festa G (Até 40 pessoas)',
      category: 'decoracoes',
      price: 'R$ 700,00',
      sizes: '4 kg Bolo + 200 Docinhos + 300 Salgados + Topo',
      description: 'Festa completa sem preocupações! 4 kg de bolo temático com topo personalizado, 200 docinhos enrolados e 300 salgadinhos generosos de 20g.',
      badge: 'Super Festa',
      image: 'kit_festa_g.jpg',
      active: true
    },
    {
      id: 'decor-kit-p',
      name: 'Kit Decoração P',
      category: 'decoracoes',
      price: 'R$ 230,00 (ou R$ 150,00 sem bexiga)',
      sizes: 'Painel Redondo + 3 Cilindros com Capas',
      description: '1 painel de fundo redondo, 3 cilindros com 4 capas temáticas, 1 arco desconstruído de bexigas, 1 tapete de chão, 4 bandejas e 2 vasos com flores.',
      badge: 'Pocket',
      image: 'decor_kit_p.jpg',
      active: true
    },
    {
      id: 'decor-kit-m',
      name: 'Kit Decoração M',
      category: 'decoracoes',
      price: 'R$ 250,00 (ou R$ 190,00 sem bexiga)',
      sizes: 'Painel de Fundo + Cômoda Fake + 3 Cilindros',
      description: '1 painel de fundo, 1 cômoda fake decorativa, 3 cilindros com 4 capas temáticas, 1 arco orgânico de balões, 1 tapete de chão e 4 bandejas.',
      badge: 'Destaque',
      image: 'decor_kit_m.jpg',
      active: true
    },
    {
      id: 'decor-kit-g',
      name: 'Kit Decoração G (Grande Completo)',
      category: 'decoracoes',
      price: 'R$ 400,00 (ou R$ 320,00 sem bexiga)',
      sizes: '2 Painéis + 2 Arcos Bexigas + Cômoda + Bolo Fake',
      description: '1 cômoda fake, 1 bolo fake, 2 painéis temáticos, 5 capas, 2 arcos volumosos de bexigas, 1 tapete de chão, 5 bandejas de doces e 2 vasos com arranjos.',
      badge: 'Espetáculo',
      image: 'decor_kit_g.jpg',
      active: true
    },

    // -----------------------------------------------------------------------
    // 4. LOCAÇÃO DE BRINQUEDOS (ESPAÇO INFANTIL E FESTAS)
    // -----------------------------------------------------------------------
    {
      id: 'brinquedo-pula-pula',
      name: 'Cama Elástica / Pula-Pula com Rede de Proteção',
      category: 'brinquedos',
      price: 'R$ 400,00 / diária',
      sizes: 'Rede de proteção reforçada + hastes acolchoadas',
      description: 'O clássico que nunca pode faltar na comemoração! Conta com rede de proteção alta e resistente, hastes revestidas com protetores macios anti-impacto, lona de salto e escadinha de acesso. Totalmente higienizado.',
      badge: 'Mais Pedido',
      image: 'brinquedo_pula_pula.jpg',
      active: true
    },
    {
      id: 'brinquedo-piscina-bolinhas',
      name: 'Piscina de Bolinhas Espumada Colorida (1m)',
      category: 'brinquedos',
      price: 'R$ 250,00 / diária',
      sizes: 'Estrutura espumada macia com bolinhas atóxicas',
      description: 'O cantinho preferido dos bebês e crianças pequenas! Borda espumada super macia que evita batidas e machucados, revestida em lona colorida higienizada e recheada com centenas de bolinhas atóxicas.',
      badge: 'Espaço Kids',
      image: 'brinquedo_piscina_bolinhas.jpg',
      active: true
    },
    {
      id: 'brinquedo-cavalinhos',
      name: 'Cavalinhos de Balanço Clássicos',
      category: 'brinquedos',
      price: '1 por R$ 60,00 | 2 por R$ 100,00',
      sizes: 'Tons vibrantes (azul e rosa) para espaço baby',
      description: 'Sucesso garantido no espaço baby! Formato ergonômico com apoio para os pés, base curva estável que evita tombamento e pegadores firmes para as mãozinhas.',
      badge: 'Baby',
      image: 'brinquedo_cavalinho.jpg',
      active: true
    },
    {
      id: 'brinquedo-jabuti',
      name: 'Gangorra Infantil Jabuti Recreativo',
      category: 'brinquedos',
      price: 'R$ 100,00 / diária',
      sizes: 'Plástico rotomoldado reforçado c/ casco duplo',
      description: 'Divertido, seguro e visualmente encantador! Estimula o equilíbrio, a coordenação motora e a socialização das crianças menores. Cantos totalmente arredondados.',
      badge: 'Lúdico',
      image: 'brinquedo_jabuti.jpg',
      active: true
    },
    {
      id: 'brinquedo-combo-completo',
      name: 'Super Combo da Diversão (Todos os Brinquedos)',
      category: 'brinquedos',
      price: 'De R$ 850,00 por apenas R$ 500,00',
      sizes: 'Pula-Pula + Piscina de Bolinhas + Jabuti + 2 Cavalinhos',
      description: 'Transforme o seu evento em um verdadeiro parque infantil! Leve o combo completo com montagem e instalação inclusas, brinquedos 100% higienizados e desconto especial de R$ 350,00.',
      badge: 'Super Promoção',
      image: 'brinquedo_combo.jpg',
      active: true
    }
  ];

  window.KAU_DEFAULT_SETTINGS = {
    headline: 'Do bolo à diversão: a festa completa em um só lugar.',
    subtitle: 'Doces artesanais irresistíveis, salgados quentinhos, decorações temáticas encantadoras e locação de brinquedos para a alegria dos pequenos. Cuidamos de cada detalhe para você só se preocupar em aproveitar!',
    phoneDisplay: '(11) 96979-8162',
    phoneRaw: '5511969798162',
    topbarText: '🎈 Sua festa completa sob encomenda! Doces, salgados, decoração e brinquedos • Garanta sua data com antecedência!',
    guaranteeText: '🔒 Pedidos e datas garantidos mediante 50% de sinal.'
  };

})(window);
