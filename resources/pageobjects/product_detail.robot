*** Settings ***
Library        SeleniumLibrary

*** Variables ***

*** Keywords ***
# KEYWORDS GERAIS
Verificar se está na tela de detalhes do produto "${PRODUTO}"
    Sleep    90ms
    Page Should Contain    text=${PRODUTO}
    Element Should Be Visible    (//div[contains(.,'${PRODUTO}')])[8]

Entrar na tela de detalhes do produto "${PRODUTO}"
    Click Element    //div[@class='inventory_item_name '][contains(.,'${PRODUTO}')]

# KEYWORDS BDD
Quando clico sobre o nome do produto "Sauce Labs Fleece Jacket"
    Entrar na tela de detalhes do produto "Sauce Labs Fleece Jacket"

Então sou redirecionado para a tela de detalhes do respectivo produto
    Verificar se está na tela de detalhes do produto "Sauce Labs Fleece Jacket"

Dado que estou na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    Verificar se está na tela de detalhes do produto "Sauce Labs Fleece Jacket"

Quando clico sobre o botão "Back to products"
    Click Button    id:back-to-products

Dado que estou na tela de detalhes do produto "Sauce Labs Backpack"
    Entrar na tela de detalhes do produto "Sauce Labs Backpack"
    Verificar se está na tela de detalhes do produto "Sauce Labs Backpack"

Quando clico sobre o botão "Add to cart"
    Click Button    id:add-to-cart-sauce-labs-backpack

Dado que estou na tela de detalhes do produto "Sauce Labs Bike Light"
    Entrar na tela de detalhes do produto "Sauce Labs Bike Light"
    Verificar se está na tela de detalhes do produto "Sauce Labs Bike Light"

