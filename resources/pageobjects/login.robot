*** Settings ***
Resource       ../suite_setup_teardown.robot
Resource       ../resources.robot
Resource       ./products.robot
Library        SeleniumLibrary

*** Variables ***
${URL}                https://www.saucedemo.com/

*** Keywords ***
# KEYWORDS BDD
Dado que estou na tela de login
    Abrir navegador
    Go To    ${URL}
    Wait Until Element Is Visible    id:login-button

Inserir o username do usuário standard
    Input Text    id:user-name    text=${STANDARD_USER}

Inserir a senha do usuário standard
    Input Password    id:password    password=${PASSWORD}
    Captura evidência

Clicar sobre o botão "Login"
    Click Button    id:login-button

Verificar se acessou a aplicação
    Verificar se está na tela de produtos
    Captura evidência