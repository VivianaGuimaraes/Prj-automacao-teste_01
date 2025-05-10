*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
abrir site do google
    Open Browser    ${site_test}    Chrome
preencher primeiro nome  
    sleep         10s   
... click Elements    ${primeiro_nome}   
... Input Text        ${primeiro_nome}   Viviana
... 

fechar navegador
    sleep        50s
    close Browser


*** Variables ***
${site_test}     https://demoqa.com/automation-practice-form

${primeiro_nome}    //*[@id="firstName"]


*** Test Cases ***
Cenário 1: Teste abrir navegador
    abrir site do google
    preencher primeiro nome



