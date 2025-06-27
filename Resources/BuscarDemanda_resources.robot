*** Settings ***
Documentation    Direciona para o arquivo Libraries-suites.robot que 
...              contém todas as library necessárias para os testes da suite BuscarDemanda
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
${MENUS_HOT}                     //a[contains(text(), 'Gestão da Demanda')]
# ${SUBMENUS_GESTAO_DEMANDA}       //a[contains(text(), 'Gestão da Demanda')]
${SUBMENUS_NOVA_DEMANDA}         //a[contains(text(), 'Nova Demanda')]
${SUBMENUS_LISTAR_DEMANDA}       //a[contains(text(), 'Listar Demandas')]
${BUSCA_DEMANDA}                 //*[@id='search_demand']
${COD_DEMANDA}                   NRJCLA2670




*** Keywords ***
Executar Suite
    [Documentation]  Executa os passos principais de login para o site HOT
    
    # Abre o navegador Chrome com o zoom definido via --force-device-scale-factor.
    [Arguments]    ${SITE_HOT}     ${zoom_fator}=1.0
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${zoom arg}=    Catenate    SEPARATOR=    --force-device-scale-factor=    ${zoom_fator}
    Call Method    ${chrome options}    add_argument    ${zoom arg}
    Create WebDriver    Chrome    options=${chrome options}
    Maximize Browser Window
    Go To    ${SITE_HOT} 

    # QUANDO informa email válido
    Wait Until Element Is Visible      ${FIELD_EMAIL}
    Click Element    ${FIELD_EMAIL}
    Input Text       ${FIELD_EMAIL}    ${EMAIL}
    Sleep    2s

    # E informa senha válida
    Click Element    ${FIELD_SENHA}
    Input Text       ${FIELD_SENHA}    ${SENHA}
    # Sleep  5s
    Capture Page Screenshot
    # E clica na funcionalidade Entrar
    Wait Until Element Contains    ${BUTTON_ENTRAR}    Entrar
    Click Element                  ${BUTTON_ENTRAR}
    # Capture Page Screenshot        ${OUTPUTDIR}/selenium-screenshot-1.png

    Wait Until Element Contains    ${popup_aviso}      Aviso
    Sleep  10s
    Capture Page Screenshot
    Click Button     ${AVISO_OK}
    Click Element    ${MENUS_HOT}
    
    Wait Until Element Is Visible    ${MENUS_HOT}    
    Scroll Element Into View         ${MENUS_HOT}  
    Sleep  5s
    Capture Page Screenshot  
    Click Element                    ${SUBMENUS_NOVA_DEMANDA}    
    
        
    # Click Element    # ${SUBMENUS_GESTAO_DEMANDA}
    # Click Element    ${submenus_nova_demandas}
    # Sleep  3s
    # Capture Page Screenshot
    # Click Element      ${SUBMENUS_LISTAR_DEMANDA}
    Sleep  3s
    Capture Page Screenshot
    # Capture Element Screenshot    ${submenus_listar_demanda}
    # Input Text       ${BUSCA_DEMANDA}     ${COD_DEMANDA}
    Sleep    5s
    Capture Page Screenshot
    # Close All Browsers
