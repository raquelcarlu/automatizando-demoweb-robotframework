*** Settings ***
Library        SeleniumLibrary
Resource       ./products.robot

*** Variables ***

*** Keywords ***
# KEYWORDS GERAIS
Abrir tela "Your Cart"
    Click Element    id:shopping_cart_container

Verificar se está no carrinho 
    Page Should Contain    text=Description
    Page Should Contain    text=QTY

# KEYWORDS BDD
Então o respectivo produto é adicionado ao carrinho
    Abrir tela "Your Cart"
    Wait Until Page Contains    text=Sauce Labs Backpack
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
    Voltar para tela de produtos

Quando clico no ícone de carrinho
    Abrir tela "Your Cart"

Então sou redirecionado para a tela de detalhes do carrinho
    Verificar se está no carrinho
    Voltar para tela de produtos

E estou na tela de detalhes do carrinho
    Abrir tela "Your Cart"
    Verificar se está no carrinho

E ambos os produtos estão presentes no carrinho
    Page Should Contain    Sauce Labs Onesie
    Page Should Contain    Sauce Labs Bolt T-Shirt

Quando clico no botão "Remove" ao lado de um dos produtos
    Click Button    id:remove-sauce-labs-onesie

Então o respectivo produto é excluído do carrinho
    Page Should Not Contain    Sauce Labs Onesie

Dado que estou na tela de detalhes do carrinho
    Verificar se está no carrinho

E possui o produto "Sauce Labs Bolt T-Shirt" no carrinho
    Page Should Contain    Sauce Labs Bolt T-Shirt

Quando clico no botão "Checkout"
    Click Button    id:checkout