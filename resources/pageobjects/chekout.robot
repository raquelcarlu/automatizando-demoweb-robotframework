*** Settings ***
Library        SeleniumLibrary
Resource       ../resources.robot

*** Keywords ***
E preencho os dados exigidos na tela "Your Information"
    Input Text    id:first-name    text=Harleen
    Input Text    id:last-name     text=Quinzel
    Input Text    id:postal-code    text=91505

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