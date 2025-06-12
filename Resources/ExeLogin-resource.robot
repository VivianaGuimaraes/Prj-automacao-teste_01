*** Settings ***
Documentation    Direciona para o arquivo Libraries-suites.robot que 
...              contém todas as library necessárias para os testes
Resource                        ../Resources/Libraries/Libraries-file_resources.robot


*** Variables ***
${SITE_HOT}                      https://hotcorphml.globalhitss.com.br/login/
${FIELD_EMAIL}                   name:username
${EMAIL}                         viviana.guimaraes@globalhitss.com.br
${FIELD_SENHA}                   name:password
${SENHA}                         Mudar@2025
${BUTTON_ENTRAR}                 id:login_submit
# ${OUTPUTDIR}                     ../results
${POPUP_AVISO}                   id:ModalLabel1
${AVISO_OK}                      xpath=//button[text()='OK']
${MENUS_HOT}                     //*[@class='navbar-toggler-icon']
${SUBMENUS_GESTAO_DEMANDA}       //a[contains(text(), 'Gestão da Demanda')]
${SUBMENUS_NOVA_DEMANDA}         //a[contains(text(), 'Nova Demanda')]
${SUBMENUS_LISTAR_DEMANDA}       //a[contains(text(), 'Listar Demandas')]
${BUSCA_DEMANDA}                 //*[@id='search_demand']
${COD_DEMANDA}                   NRJCLA2670


*** Keywords ***
Executar Suite
    [Documentation]  Executa os passos principais de login para o site HOT
    Open Browser      ${SITE_HOT}    Chrome
    Maximize Browser Window

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
    Sleep  3s
    Capture Page Screenshot
    Click Button     ${AVISO_OK}
    Click Element    ${MENUS_HOT}
    Click Element    ${SUBMENUS_GESTAO_DEMANDA}
    # Click Element    ${submenus_nova_demandas}
    Sleep  3s
    Capture Page Screenshot
    Click Element    ${SUBMENUS_LISTAR_DEMANDA}
    Sleep  3s
    Capture Page Screenshot
    # Capture Element Screenshot    ${submenus_listar_demanda}
    Input Text       ${BUSCA_DEMANDA}     ${COD_DEMANDA}
    Sleep    5s
    Capture Page Screenshot
    Close All Browsers
