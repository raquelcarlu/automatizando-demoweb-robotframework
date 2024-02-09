*** Settings ***
Resource            ../resources/resources.robot
Suite Setup         Logar com usuário standard
Test Teardown       Captura evidência
Suite Teardown      Fechar navegador

*** Test Cases ***
# Cenário 01: 
    
Cenário 02: Entrar na tela de detalhes de um produto
    Dado que estou na tela de produtos
    Quando clico sobre o nome do produto "Sauce Labs Fleece Jacket"
    Então sou redirecionado para a tela de detalhes do respectivo produto

Cenário 03: Retornar para a página de produtos
    Dado que estou na tela de detalhes do produto "Sauce Labs Fleece Jacket"
    Quando clico sobre o botão "Back to products"
    Então sou redirecionado para a tela de produtos

Cenário 04: Adicionar produto desde a tela de detalhes do produto 
    Dado que estou na tela de detalhes do produto "Sauce Labs Backpack"
    Quando clico sobre o botão "Add to cart"
    Então o respectivo produto é adicionado ao carrinho

Cenário 05: Remover produto do carrinho
    Dado que estou na tela de detalhes do produto "Sauce Labs Backpack"
    E este mesmo produto foi adicionado no carrinho
    E o botão "Remove" está disponível
    Quando clico sobre o botão "Remove"
    O respectivo produto é excluído do carrinho

Cenário 06: Entrar na tela de detalhes do carrinho desde a tela de produtos
    Dado que estou na tela de produtos
    Quando clico no ícone de carrinho
    Então sou redirecionado para a tela de detalhes do carrinho

Cenário 07: Entrar na tela de detalhes do carrinho desde a tela de detalhes do produto
    Dado que estou na tela de detalhes do produto "Sauce Labs Bike Light"
    Quando clico no ícone de carrinho
    Então sou redirecionado para a tela de detalhes do carrinho

Cenário 08: Remover produtos do carrinho
    Dado que dois produtos foram adicionados no carrinho
    E estou na tela de detalhes do carrinho
    E ambos os produtos estão presentes no carrinho
    Quando clico no botão "Remove" ao lado de um dos produtos
    Então o respectivo produto é excluído do carrinho

Cenário 09: Concluir compra
    Dado que estou na tela de detalhes do carrinho
    E possui o produto "Sauce Labs Bolt T-Shirt" no carrinho
    Quando clico no botão "Checkout"
    E preencho os dados exigidos na tela "Your Information"
    E clico no botão "Continue"
    E clico no botão "Finish" na tela "Checkout: Overview"
    Então o pedido é completo e sou redirecionado para a tela de agradecimento