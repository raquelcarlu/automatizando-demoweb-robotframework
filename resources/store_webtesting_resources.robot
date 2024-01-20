*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}            chrome
${URL}                https://www.saucedemo.com/
${STANDARD_USER}      standard_user
${PASSWORD}           secret_sauce
${PRODUCTS}           Products
${TELA_ATUAL}
${FILENAME_INDEX}

*** Keywords ***
# KEYWORDS GERAIS
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fim de um teste
    [Arguments]    ${FILENAME_INDEX}
    Sleep    100ms
    Capture Page Screenshot    filename=cenario-${FILENAME_INDEX}.png

Abrir tela "Your Cart"
    Click Element    id:shopping_cart_container

Verificar se está na tela de produtos
    Wait Until Page Contains    text=${PRODUCTS}
    # Set Test Variable    ${TELA_ATUAL}    tela_produtos

Verificar se está na tela de detalhes do produto "${PRODUTO}"
    Sleep    90ms
    Page Should Contain    text=${PRODUTO}
    Element Should Be Visible    (//div[contains(.,'${PRODUTO}')])[8]

Entrar na tela de detalhes do produto "${PRODUTO}"
    Click Element    //div[@class='inventory_item_name '][contains(.,'${PRODUTO}')]

Voltar para tela de produtos
    Click Button    id:continue-shopping
    Verificar se está na tela de produtos

# KEYWORDS BDD
Dado que estou na tela de login
    Abrir navegador
    Go To    ${URL}
    Wait Until Element Is Visible    id:login-button

Quando entro o username do usuário standard
    Input Text    id:user-name    text=${STANDARD_USER}

E entro a senha do usuário standard
    Input Password    id:password    password=${PASSWORD}
    Fim de um teste    00

E clico sobre o botão "Login"
    Click Button    id:login-button

Então acesso a tela principal da aplicação
    Verificar se está na tela de produtos
    Fim de um teste    01

Dado que estou na tela principal da aplicação
    Verificar se está na tela de produtos

Quando clico sobre o nome do produto "Sauce Labs Fleece Jacket"
    Entrar na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    
Então sou redirecionado para a tela de detalhes do respectivo produto
    Verificar se está na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    Fim de um teste    02

Dado que estou na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    Verificar se está na tela de detalhes do produto "Sauce Labs Fleece Jacket"

Quando clico sobre o botão "Back to products"
    Click Button    id:back-to-products

Então sou redirecionado para a tela de produtos
    Então acesso a tela principal da aplicação
    Fim de um teste    03

Dado que estou na tela de detalhes do produto "Sauce Labs Backpack"
    Entrar na tela de detalhes do produto "Sauce Labs Backpack"
    Verificar se está na tela de detalhes do produto "Sauce Labs Backpack"

Quando clico sobre o botão "Add to cart"
    Click Button    id:add-to-cart-sauce-labs-backpack

Então o respectivo produto é adicionado ao carrinho
    Abrir tela "Your Cart"
    Wait Until Page Contains    text=Sauce Labs Backpack
    Fim de um teste    04
    Voltar para tela de produtos
    
E este mesmo produto foi adicionado no carrinho
    Abrir tela "Your Cart"
    Wait Until Page Contains    text=Sauce Labs Backpack
    Click Element    //div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
    
E o botão "Remove" está disponível
    Wait Until Element Is Visible    id:remove-sauce-labs-backpack
    
Quando clico sobre o botão "Remove"
    Click Button    id:remove-sauce-labs-backpack

O respectivo produto é excluído do carrinho
    Abrir tela "Your Cart"
    Page Should Not Contain    text=Sauce Labs Backpack
    Fim de um teste    05
    Voltar para tela de produtos

Dado que estou na tela de produtos
    Verificar se está na tela de produtos

Quando clico no ícone de carrinho
    Abrir tela "Your Cart"

Então sou redirecionado para a tela de detalhes do carrinho
    Page Should Contain    text=Description
    Page Should Contain    text=QTY
    Fim de um teste    06
    Voltar para tela de produtos