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

Captura evidência
    Sleep    100ms
    Capture Page Screenshot    filename=evidencia-{index}.png

Abrir tela "Your Cart"
    Click Element    id:shopping_cart_container

Verificar se está no carrinho 
    Page Should Contain    text=Description
    Page Should Contain    text=QTY

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
    Captura evidência

E clico sobre o botão "Login"
    Click Button    id:login-button

Então acesso a tela principal da aplicação
    Verificar se está na tela de produtos
    Captura evidência

Dado que estou na tela principal da aplicação
    Verificar se está na tela de produtos

Quando clico sobre o nome do produto "Sauce Labs Fleece Jacket"
    Entrar na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    
Então sou redirecionado para a tela de detalhes do respectivo produto
    Verificar se está na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    Captura evidência

Dado que estou na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    Verificar se está na tela de detalhes do produto "Sauce Labs Fleece Jacket"

Quando clico sobre o botão "Back to products"
    Click Button    id:back-to-products

Então sou redirecionado para a tela de produtos
    Então acesso a tela principal da aplicação
    Captura evidência

Dado que estou na tela de detalhes do produto "Sauce Labs Backpack"
    Entrar na tela de detalhes do produto "Sauce Labs Backpack"
    Verificar se está na tela de detalhes do produto "Sauce Labs Backpack"

Quando clico sobre o botão "Add to cart"
    Click Button    id:add-to-cart-sauce-labs-backpack

Então o respectivo produto é adicionado ao carrinho
    Abrir tela "Your Cart"
    Wait Until Page Contains    text=Sauce Labs Backpack
    Captura evidência
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
    Captura evidência
    Voltar para tela de produtos

Dado que estou na tela de produtos
    Verificar se está na tela de produtos

Quando clico no ícone de carrinho
    Abrir tela "Your Cart"

Então sou redirecionado para a tela de detalhes do carrinho
    Verificar se está no carrinho
    Captura evidência
    Voltar para tela de produtos

Dado que estou na tela de detalhes do produto "Sauce Labs Bike Light"
    Entrar na tela de detalhes do produto "Sauce Labs Bike Light"
    Verificar se está na tela de detalhes do produto "Sauce Labs Bike Light"

Dado que dois produtos foram adicionados no carrinho
    Verificar se está na tela de produtos
    Click Button    id:add-to-cart-sauce-labs-onesie
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt

E estou na tela de detalhes do carrinho
    Abrir tela "Your Cart"
    Verificar se está no carrinho

E ambos os produtos estão presentes no carrinho
    Page Should Contain    Sauce Labs Onesie
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Captura evidência

Quando clico no botão "Remove" ao lado de um dos produtos
    Click Button    id:remove-sauce-labs-onesie

Então o respectivo produto é excluído do carrinho
    Page Should Not Contain    Sauce Labs Onesie
    Captura evidência

Dado que estou na tela de detalhes do carrinho
    Verificar se está no carrinho

E possui o produto "Sauce Labs Bolt T-Shirt" no carrinho
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Captura evidência

Quando clico no botão "Checkout"
    Click Button    id:checkout

E preencho os dados exigidos na tela "Your Information"
    Input Text    id:first-name    text=Harleen
    Input Text    id:last-name     text=Quinzel
    Input Text    id:postal-code    text=91505
    Captura evidência

E clico no botão "Continue"
    Click Button    id:continue

E clico no botão "Finish" na tela "Checkout: Overview"
    Captura evidência
    Click Button    id:finish

Então o pedido é completo e sou redirecionado para a tela de agradecimento
    Page Should Contain    Checkout: Complete!
    Page Should Contain    Thank you for your order!
    Captura evidência
    Click Button    id:back-to-products