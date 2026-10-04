@echo off
chcp 65001 > nul
echo ======================================================
echo    KAU FESTAS - PUBLICADOR AUTOMATICO VERCEL / GITHUB
echo ======================================================
echo.

cd /d "%~dp0"

echo [1/3] Verificando arquivos alterados...
git status -s

echo.
echo [2/3] Empacotando e salvando alteracoes...
git add .
git commit -m "Atualizacao automatica do site - %date% %time%"

echo.
echo [3/3] Enviando para GitHub e publicando na Vercel...
git push origin main

echo.
if %errorlevel% equ 0 (
    echo ======================================================
    echo  SUCESSO! Seu site estara atualizado em ~1 minuto em:
    echo  https://kau-festas.vercel.app/
    echo ======================================================
) else (
    echo [ERRO] Ocorreu uma falha ao enviar. Verifique sua conexao.
)

echo.
pause
