*** Settings ***
Documentation    Suite para validar login no sistema HOT
# Resource    ../Resources/CriarDemanda_resources.robot
# Resource    ../Resources/LogarHot_resources.robot
#Resource    ../Resources/ZoomNavegador_resources.robot
Resource     ../Resources/LogarHot_resources.robot
#Resource    ../Resources/ApagaCriaDiretorio_resources.robot
Resource     ../Resources/ApagaCriaDiretorio_resources.robot

*** Test Cases ***
# CT-1: Abrir navegador e site HOT
#     [ Documentation ]   Valida se o usuário consegue acessar o sistema com sucesso.

#     Abrir Navegador Com Zoom Personalizado   ${SITE_HOT}    ${ZOOM_FATOR}

CT-1: Login com sucesso no HOT
    [ Documentation ]   Valida se o usuário consegue acessar o sistema HOT com sucesso.
    # Preparar Ambiente de Execução 
    Abre Navegador Com Zoom Personalizado   ${SITE_HOT}    ${ZOOM_FATOR}
    Informa dados validos de login
    # Clica na funcionalidade Entrar
    # Fecha pop up Aviso
    # Acessa modulo Gestao da Demanda
    # Acessa sub menu do modulo Gestao da demanda

    