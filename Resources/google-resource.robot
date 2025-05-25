***Setting***
Library        SeleniumLibrary


*** Variables ***
${site_google}         https://google.com.br



*** Keywords ***

#CT-1: Logar com sucesso no HOT

DADO que usuario que acessa o site do GOOGLE
    Open Browser    ${site_google}     Chrome
    Sleep    50s
    Capture Page Screenshot
    #Maximize Browser Window