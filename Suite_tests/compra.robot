*** Settings ***


#Library        SeleniumLibrary
#Resource       ../Prj-automacao-teste_01/Resources/google-resource.robot 
#Resource        ../Prj-automacao-teste_01/Resources/Libraries-suites.robot

#direciona para o arquivo "Libraries-suites.robot" que contém todoas as library necessárias para os testes
Resource        ../Resources/Libraries/Libraries-file_resources.robot

*** Variables ***
${site_diverso}         https://www.computandoarte.com.br


*** Test Cases ***
Teste simples
    Open Browser    ${site_diverso}     Chrome
    Maximize Browser Window
    Sleep    7s
    Capture Page Screenshot 
    Close Browser