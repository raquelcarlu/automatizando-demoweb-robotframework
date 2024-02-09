*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${PRODUCTS}           Products

*** Keywords ***
# KEYWORDS GERAIS
Verificar se está na tela de produtos
    Wait Until Page Contains    text=${PRODUCTS}

Voltar para tela de produtos
    Click Button    id:continue-shopping
    Verificar se está na tela de produtos

# KEYWORDS BDD
Dado que estou na tela de produtos
    Verificar se está na tela de produtos

Então sou redirecionado para a tela de produtos
    Verificar se está na tela de produtos

Dado que dois produtos foram adicionados no carrinho
    Verificar se está na tela de produtos
    Click Button    id:add-to-cart-sauce-labs-onesie
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt

