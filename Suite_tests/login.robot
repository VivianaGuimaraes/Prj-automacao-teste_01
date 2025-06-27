*** Settings ***
Documentation     Teste de login com zoom ajustado via argumentos do Chrome
Resource          ../Resources/utils_test.robot

*** Variables ***
${SITE_HOT}       https://hotcorphml.globalhitss.com.br/login/
${ZOOM_FATOR}     0.9

*** Test Cases ***
Abrir Site Com Zoom Definido
    Abrir Navegador Com Zoom Personalizado    ${SITE_HOT}    ${ZOOM_FATOR}