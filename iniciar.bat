@echo off
chcp 65001 >nul
title Gabaritando ENEM
cd /d "%~dp0"

rem 0) Confere se o arquivo esta na pasta certa (a que tem a pasta "src")
if not exist "src\main.py" (
    echo.
    echo ERRO: este arquivo precisa ficar DENTRO da pasta do projeto Gabaritando,
    echo ao lado da pasta "src" e do arquivo "requerimentos.txt".
    echo.
    echo Pasta onde ele esta agora: %~dp0
    echo.
    pause
    exit /b 1
)

rem 1) Cria o ambiente virtual (.venv) se ele ainda nao existir
if not exist ".venv\Scripts\python.exe" (
    echo Criando o ambiente virtual...
    py -m venv .venv 2>nul || python -m venv .venv
    if errorlevel 1 (
        echo.
        echo Nao consegui criar o ambiente virtual. Confira se o Python esta instalado.
        pause
        exit /b 1
    )
)

rem 2) Instala as dependencias so se ainda nao estiverem instaladas
".venv\Scripts\python.exe" -c "import flask, pymupdf" 2>nul
if errorlevel 1 (
    echo Instalando as dependencias, isso so acontece na primeira vez...
    ".venv\Scripts\python.exe" -m pip install pymupdf flask
    if errorlevel 1 (
        echo.
        echo Nao consegui instalar as dependencias. Confira a conexao com a internet.
        pause
        exit /b 1
    )
)

rem 3) Abre o navegador daqui a 3 segundos, dando tempo do servidor subir
start "" cmd /c "timeout /t 3 /nobreak >nul && start http://127.0.0.1:5000"

rem 4) Inicia o servidor. Para encerrar, feche esta janela ou aperte Ctrl+C
echo.
echo Gabaritando ENEM rodando em http://127.0.0.1:5000
echo Para encerrar, feche esta janela.
echo.
cd src
"..\.venv\Scripts\python.exe" main.py
pause
