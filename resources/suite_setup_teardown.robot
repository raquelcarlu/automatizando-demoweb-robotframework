*** Settings ***
Resource    ../resources/pageobjects/login.robot

*** Variables ***
${BROWSER}            chrome
${STANDARD_USER}      standard_user
${PASSWORD}           secret_sauce

*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Logar com usuário standard
    Abrir navegador
    Dado que estou na tela de login
    Inserir o username do usuário standard
    Inserir a senha do usuário standard
    Clicar sobre o botão "Login"
    Verificar se acessou a aplicação

Fechar navegador
    Close Browser