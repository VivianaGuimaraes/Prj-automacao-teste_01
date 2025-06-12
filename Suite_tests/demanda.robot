*** Settings ***
Documentation    Suite para validar login no sistema HOT
Resource    ../Resources/ExeLogin-resource.robot


*** Test Cases ***
CT-1: Login com sucesso no HOT
    [ Documentation ]   Valida se o usuário consegue acessar o sistema com sucesso.

    Executar Suite
