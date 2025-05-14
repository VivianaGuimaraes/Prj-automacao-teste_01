*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url-hot}        https://hotcorphml.globalhitss.com.br/login/
${field-login}    viviana.guimaraes@globalhitss.com.br
${field-senha}    '#Mudar@8479'
*** Keywords ***

# CT-1: Logar com sucesso no HOT
DADO usuário que acessa o site do HOT
    Open Browser    ${url-hot}
QUANDO informa login válido 
    Click 
E informa senha válida
E clica na funcionalidade login
ENTÃO sistema carrega interface inicial do HOT

