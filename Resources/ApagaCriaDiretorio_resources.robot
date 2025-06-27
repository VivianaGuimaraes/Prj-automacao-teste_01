*** Settings ***
Documentation    Direciona para o arquivo Libraries-suites.robot que 
...              apagar e criar diretório no início do teste
Resource                        ../Resources/Libraries/Libraries-file_resources.robot

*** Variables ***
${DIRETORIO_RESULTADOS}    Results_test

*** Keywords ***
Preparar Ambiente de Execução
    # [Documentation]    Remove e recria a pasta de resultados
    Remove Directory    ${DIRETORIO_RESULTADOS}    recursive=True
    Create Directory    ${DIRETORIO_RESULTADOS}