*** Settings ***
Documentation    Suite para validar login no sistema HOT
Resource    ../Resources/BuscarDemanda_resources.robot


*** Test Cases ***
CT-1: Buscar demanda no HOT
    [ Documentation ]   Valida se o usuário consegue acessar o sistema com sucesso.

    Abre Navegador Com Zoom Personalizado   ${SITE_HOT}    ${ZOOM_FATOR}
    Acessa modulo Gestao da Demanda
    