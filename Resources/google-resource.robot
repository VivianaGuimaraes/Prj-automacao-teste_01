*** Settings ***
# Library        SeleniumLibrary
# Library        OperatingSystem
#Resource       ../Librarys/Library-suites.robot
#Resource        ../Prj-automacao-teste_01/Librarys/Library-suites.robot
#Library         SeleniumLibrary


#direciona para o arquivo "Libraries-suites.robot" que contém todoas as library necessárias para os testes
Resource        ../Resources/Libraries/Libraries-file_resources.robot


*** Variables ***
${site_google}         https://google.com.br



*** Keywords ***

#CT-1: Logar com sucesso no HOT

DADO que usuario que acessa o site do GOOGLE
    Open Browser    ${site_google}     Chrome
    Maximize Browser Window
    Sleep    5s
    Capture Page Screenshot 
    close Browser
    
    
   