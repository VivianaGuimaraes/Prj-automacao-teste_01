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
#${SUBMENUS_NOVA_DEMANDA}         //a[contains(text(), 'Nova Demanda')]
${SUBMENUS_LISTAR_DEMANDA}       //a[contains(text(), 'Listar Demandas')]

&{BUSCA_DEMANDA}                 
...    locator=//*[@id='search_demand']
...    valor=NRJCLA2670

${RESULTADO_BUSCA_DEMANDA}    //*[@id="table"]/tbody/tr/th[text()='NRJCLA2670']
#${RESULTADO_BUSCA_DEMANDA}    //th[contains(text(), '${BUSCA_DEMANDA.valor}')]

${BUSCAR_LINK}               //button[text()='Buscar Link']    #//*[@id="btn-bp-check"]




*** Keywords ***
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
    Sleep  15s
    Capture Page Screenshot  
    

 Acessa modulo Gestao da Demanda 2
    Scroll Element Into View        ${SUBMENUS_LISTAR_DEMANDA}
    Click Element                   ${SUBMENUS_LISTAR_DEMANDA}
    Sleep  2s
    Input Text         ${BUSCA_DEMANDA.locator}     ${BUSCA_DEMANDA.valor}
    Sleep  10s
    Capture Page Screenshot
    Sleep  2s
    Click Element     ${RESULTADO_BUSCA_DEMANDA}  
    Sleep  20s
    Capture Page Screenshot
    Wait Until Element Is Visible              20s 
    Scroll Element Into View         ${BUSCAR_LINK}    
   # #  #Click Element     ${RESULTADO_BUSCA_DEMANDA}
    Capture Page Screenshot
    Sleep  20s
    
   #  ${fase_2} =    Get Text          //div[@class="actual_phase"] 
   #  IF     '${fase_2}' == 'Fase Atual: Elaborar e Anexar BP'
   #  Log    Fase da demanda alterada com sucesso! \n PROP. TÉCNICA -> ${fase_2}
        
   #  ELSE
   #  Log    Fase atual inválida: ${fase_2}
   #  Fail   Fase incorreta.
   #  END             





    
    

   #  Sleep  5s
   #  ${fase_2} =    Get Text          //div[@class="actual_phase"] 
   #  IF     '${fase_2}' == 'Fase Atual: Elaborar e Anexar BP'
   #  Log    Fase da demanda alterada com sucesso! \n PROP. TÉCNICA -> ${fase_2}
    
   #  ELSE
   #  Log    Fase atual inválida: ${fase_2}
   #  Fail   Fase incorreta.
   #  END      
    
    

    #${busca_codigo} =    Get Text          ${RESULTADO_BUSCA_DEMANDA} 
    #IF     '${busca_codigo}' == '${RESULTADO_BUSCA_DEMANDA} '
    #Log    Código correto -> '{busca_codigo}'
    #Capture Page Screenshot
    #ELSE
    #Log    Código inexistente: ${busca_codigo}
    #Fail   Código incorreto.
    #END






    # Capture Page Screenshot
    # # Close All Browsers