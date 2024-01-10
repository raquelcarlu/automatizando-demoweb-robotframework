*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}            chrome
${URL}                https://www.saucedemo.com/
${STANDARD_USER}      standard_user
${PASSWORD}           secret_sauce
${PRODUCTS}           Products

*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que estou na tela de login
    Abrir navegador
    Go To    ${URL}
    Wait Until Element Is Visible    locator=login-button

Quando entro o username do usuário standard
    Input Text    locator=user-name    text=${STANDARD_USER}

E entro a senha do usuário standard
    Input Password    locator=password    password=${PASSWORD}

E clico sobre o botão "Login"
    Capture Page Screenshot
    Click Button    locator=login-button

Então acesso a tela principal da aplicação
    Wait Until Page Contains    text=${PRODUCTS}
    Fechar o navegador

Quando estou na tela principal da aplicação
    Então acesso a tela principal da aplicação

Então o título da aplicação é "Swag Labs"
