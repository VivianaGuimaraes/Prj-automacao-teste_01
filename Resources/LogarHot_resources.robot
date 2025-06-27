*** Settings ***
Documentation    Direciona para o arquivo Libraries-suites.robot que 
...              contém todas as library necessárias para os testes da suite LogarHot
Resource                        ../Resources/Libraries/Libraries-file_resources.robot


*** Variables ***
${SITE_HOT}                      https://hotcorphml.globalhitss.com.br/login/
${ZOOM_FATOR}                    0.9
${ZOOM_ARG}                      --force-device-scale-factor=0.8
${FIELD_EMAIL}                   name:username
${EMAIL}                         viviana.guimaraes@globalhitss.com.br
${FIELD_SENHA}                   name:password
${SENHA}                         Mudar@2025
${BUTTON_ENTRAR}                 id:login_submit
${POPUP_AVISO}                   id:ModalLabel1 
${AVISO_OK}                      xpath=//button[text()='OK']
# ${MENUS_HOT}                     //a[contains(text(), 'Gestão da Demanda')]
# # ${SUBMENUS_GESTAO_DEMANDA}       //a[contains(text(), 'Gestão da Demanda')]
# ${SUBMENUS_NOVA_DEMANDA}         //a[contains(text(), 'Nova Demanda')]
# ${SUBMENUS_LISTAR_DEMANDA}       //a[contains(text(), 'Listar Demandas')]
# ${BUSCA_DEMANDA}                 //*[@id='search_demand']
# ${COD_DEMANDA}                   NRJCLA2670


*** Keywords ***

ApagaCriaDiretorio_resources.Preparar Ambiente de Execução
Abre Navegador Com Zoom Personalizado
    [Documentation]  Executa os passos principais de login para o site HOT
    
    # Abre o navegador Chrome com o zoom definido via --force-device-scale-factor.
    [Arguments]    ${SITE_HOT}     ${zoom_fator}=1.0
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${zoom arg}=    Catenate    SEPARATOR=    --force-device-scale-factor=    ${zoom_fator}
    Call Method    ${chrome options}    add_argument    ${zoom arg}
    Create WebDriver    Chrome    options=${chrome options}
    Maximize Browser Window
    Go To    ${SITE_HOT} 
  

Informa dados validos de login
    # QUANDO informa email válido
    Wait Until Element Is Visible      ${FIELD_EMAIL}
    Click Element    ${FIELD_EMAIL}
    Input Text       ${FIELD_EMAIL}    ${EMAIL}
    Sleep   2s

    # E informa senha válida
    Click Element    ${FIELD_SENHA}
    Input Text       ${FIELD_SENHA}    ${SENHA}
    
    # Clica na funcionalidade Entrar
    Wait Until Element Contains    ${BUTTON_ENTRAR}    Entrar
    Capture Page Screenshot
    Click Element                  ${BUTTON_ENTRAR}
    Sleep   2s
   

    # Fecha pop up aviso
    Wait Until Element Contains    ${popup_aviso}      Aviso
    Capture Page Screenshot
    Click Element                  ${AVISO_OK}    
    Sleep   2s
    Capture Page Screenshot
