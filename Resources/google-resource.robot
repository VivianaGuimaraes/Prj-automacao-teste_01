*** Setting ***
# Library        SeleniumLibrary
# Library        OperatingSystem
Resource       ../Resources/Library-suites.robot


*** Variables ***
${site_google}         https://google.com.br



*** Keywords ***

#CT-1: Logar com sucesso no HOT

DADO que usuario que acessa o site do GOOGLE
    Open Browser    ${site_google}     Chrome
    Maximize Browser Window
    Sleep    5s
    
   