*** Settings ***
Resource       ../Prj-automacao-teste_01/Librarys/Library-suites.robot
#Resource    C:/GLOBAL_HITSS/Prj-automacao-teste_01/Librarys/Library-suites.robot


*** Variables ***
${name_user}    Viviana Ribeiro


*** Test Cases ***
caso de Teste
    Teste novo    #${name_user}

*** Keywords ***

Teste novo
#     [Arguments]    ${name_user}   #${nome}
#     Log To Console    \nEU QUERO SABER QUEM É: ${name_user}  #${nome}
#         Run Keyword If '${name_user}' == 'Maria'
#         Log To Console \n NOME DIFERENTE
#         Run Keyword If '${name_user}' == 'Viviana Ribeiro'
#         Log To Console \n NOME DIFERENTE


# caso de Teste
    #Log To Console    \nEU QUERO SABER QUEM É: ${name_user}
    Run Keyword If    '${name_user}' == 'Maria'    Log To Console    Olá, Maria!
    Run Keyword If    '${name_user}' != 'Maria'    Log To Console    O nome secreto é ${name_user} 
       

