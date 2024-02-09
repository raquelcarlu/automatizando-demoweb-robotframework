*** Settings ***
Library        SeleniumLibrary
Resource       suite_setup_teardown.robot
Resource       ./pageobjects/cart.robot
Resource       ./pageobjects/product_detail.robot
Resource       ./pageobjects/products.robot
Resource       ./pageobjects/chekout.robot

*** Keywords ***
Captura evidência
    Sleep    100ms
    Capture Page Screenshot    filename=evidencia-{index}.png