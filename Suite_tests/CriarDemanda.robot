*** Settings ***
Documentation    Suite para validar login no sistema HOT
Resource    ../Resources/CriarDemanda_resources.robot


*** Test Cases ***
CT-1: Cria nova demanda no HOT
    [ Documentation ]   Valida se o usuário consegue acessar o sistema com sucesso.

    Abre Navegador Com Zoom Personalizado   ${SITE_HOT}    ${ZOOM_FATOR}
    Acessa modulo Gestao da Demanda
    Preenche formulario Prospecção - Criacao Demanda
    Preenche formulario Prospecção - Adotar Demanda
    Preenche formulario Prospecção - Definir Prioridade 
    Preenche formulario Prospecção - Definir Complexidade
    Preenche formulario Prospecção - Elaborar Solução_PT-PC
 
    
    
    