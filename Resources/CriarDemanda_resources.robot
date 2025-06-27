*** Settings ***
Documentation    Direciona para o arquivo Libraries-suites.robot que 
...              contém todas as library necessárias para os testes para os testes da suite CriarDemanda
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

#Formulário Prospecção - campo CLASSIFICAÇÃO
${FIELD_F1_CLASSIFICACAO}                           //*[@id="classification"]
${CLASSIFICACAO_OPORTUNIDADE}                      //*[@id="classification"]/option[text()="OPORTUNIDADE"]
${POPUP_CLASSIFICAO_OPORTUNIDADE}                 //h1[text()="Esta Oportunidade se trata de um projeto legado?"]
${POPUP_CLASSIFICAO_OPOTUNIDADE_NAO}             //button[@id="close_legacy_modal"]  
# ${POPUP_CLASSIFICAO_OPOTUNIDADE_SIM}            //button[@id="is_legacy"]

#Formulário Prospecção - campo TITULO DA DEMANDA
${FIELD_F1_TITULO_DEMANDA}                       //*[@id="demand_title"]
${TITULO_DEMANDA_NOME_SELECAO}                  //*[@id="client_exec_director"]/option[2]


${FIELD_F1_CLIENTE}                            //*[@id="client"]/option[82]
${FIELD_F1_DIRETORIA_CLIENTE}                  //*[@id="client_director"]/option[22]
${FIELD_F1_GERENTE_CLIENTE}                   //*[@id="client_manager"]/option[3]
${FIEDL_F1_LIDER_TEC_CLIENTE}                 //*[@id="client_technical_owner"]/option[2]
${FIELD_F1_HORIZONTAL_VERTICAL}               //*[@id="horizontal_vertical"]/option[2]
${FIELD_F1_SEGMENTO}                          //*[@id="segmento"]/option[2]
${FIELD_F1_DT_INICIO_PROJ}                   //*[@id="expected_start_date"]
${FIELD_F1_TIPO_CONTRATACAO}                //*[@id="hiring_type"]/option[3]   # [2]=LPU / [3]=Serviço Gerenciado
${FIELD_F1_ANEXAR_ARQUIVO}                  //*[@id="input-file-client"]
${CAMINHO_ARQUIVO}                          C:/GLOBAL_HITSS/GEST-DEMANDAS/data/MASSA.xlsx
${FIELD_F1_DESCRICAO}                      //*[@id="description"]
${SUBMETER_F1_FASE}                          //*[@id="btn_save_all"]


${SUBMENUS_LISTAR_DEMANDA}       //a[contains(text(), 'Listar Demandas')]
${BUSCA_DEMANDA}                 //*[@id='search_demand']
${COD_DEMANDA}                   NRJCLA2670




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
    # [Documentation]  Executa os passos principais de login para o site HOT
    
    # # Abre o navegador Chrome com o zoom definido via --force-device-scale-factor.
    # [Arguments]    ${SITE_HOT}     ${zoom_fator}=1.0
    # ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    # ${zoom arg}=    Catenate    SEPARATOR=    --force-device-scale-factor=    ${zoom_fator}
    # Call Method    ${chrome options}    add_argument    ${zoom arg}
    # Create WebDriver    Chrome    options=${chrome options}
    # Maximize Browser Window
    # Go To    ${SITE_HOT} 

    # Informa dados validos
    # QUANDO informa email válido
    Wait Until Element Is Visible      ${FIELD_EMAIL}
    Click Element    ${FIELD_EMAIL}
    Input Text       ${FIELD_EMAIL}    ${EMAIL}
    Sleep   2s

    # E informa senha válida
    Click Element    ${FIELD_SENHA}
    Input Text       ${FIELD_SENHA}    ${SENHA}
    
    # Clica na funcionalidade Entrar
    Wait Until Element Contains      ${BUTTON_ENTRAR}    Entrar
    Click Element                    ${BUTTON_ENTRAR}
    Sleep   2s
    Capture Page Screenshot

    # Fecha pop up aviso
    Wait Until Element Contains      ${POPUP_AVISO}      Aviso
    Sleep  2s
    Capture Page Screenshot
    Click Button                     ${AVISO_OK}
Acessa modulo Gestao da Demanda
    Click Element                    ${MENUS_HOT}
    Sleep  2s
    Capture Page Screenshot  
    # Acessa sub menu do modulo Gestao da demanda > NOVA DEMANDA
    Click Element                    ${SUBMENUS_NOVA_DEMANDA}    
    Sleep  2s
    Capture Page Screenshot

Preenche formulario Prospecção - Criacao Demanda
    # Campo Classificação  
    Click Element                    ${FIELD_F1_CLASSIFICACAO}
    Click Element                    ${CLASSIFICACAO_OPORTUNIDADE}
    Sleep  2s
    Capture Page Screenshot     
    Wait Until Element Is Visible    ${POPUP_CLASSIFICAO_OPORTUNIDADE}
    Click Element                    ${POPUP_CLASSIFICAO_OPOTUNIDADE_NAO}
    # Click Element                    ${POPUP_CLASSIFICAO_OPOTUNIDADE_SIM}
    Capture Page Screenshot 
    
    # Campo Título da Demanda
    Input Text                     ${FIELD_F1_TITULO_DEMANDA}     OPORTUNIDADE - Viviana
    Click Element                  ${TITULO_DEMANDA_NOME_SELECAO}
    
    
    # Campo Cliente
    Click Element                  ${FIELD_F1_CLIENTE}  
    Sleep  1s
    Click Element                  ${FIELD_F1_DIRETORIA_CLIENTE}
    Sleep  1s 
    Click Element                  ${FIELD_F1_GERENTE_CLIENTE} 
    Sleep  2s
    Click Element                  ${FIEDL_F1_LIDER_TEC_CLIENTE}   
    Sleep  2s              
    Click Element                  ${FIELD_F1_HORIZONTAL_VERTICAL}               
    Click Element                  ${FIELD_F1_SEGMENTO}   
    Input Text                     ${FIELD_F1_DT_INICIO_PROJ}       26/06/2025 
    Click Element                  ${FIELD_F1_TIPO_CONTRATACAO} 
    Sleep  2s
    Log                            ${CAMINHO_ARQUIVO}  
    File Should Exist              ${CAMINHO_ARQUIVO}
    Choose File                    ${FIELD_F1_ANEXAR_ARQUIVO}     ${CAMINHO_ARQUIVO}
    Input Text                     ${FIELD_F1_DESCRICAO}  DEMANDA OPORTUNIDADE SEM LPU
    Capture Page Screenshot  
    Scroll Element Into View       ${SUBMETER_F1_FASE}
    Click Button                   ${SUBMETER_F1_FASE}
    Capture Page Screenshot 
    Sleep  20s 
    Capture Page Screenshot 
    
    ${fase} =    Get Text          //div[@class="actual_phase"] 
    
    IF     '${fase}' == 'Fase Atual: Adotar Demanda'
    Log    Demanda criada com sucesso! \n PROSPECÇÃO -> ${fase}
           
    # Aqui você colocaria os passos seguintes
    ELSE
    Log    Fase atual inválida: ${fase}
    Fail   Fase incorreta.
    END
    
    #Sleep  40s
#Preenche formulario Prospecção - Adotar Demanda 

    # Capture Element Screenshot    ${submenus_listar_demanda}
    # Input Text       ${BUSCA_DEMANDA}     ${COD_DEMANDA}
    # Sleep    5s
    # Capture Page Screenshot
    # Close All Browsers




# # Executar Suite
# #     [Documentation]  Executa os passos principais de login para o site HOT
    
# #     # Abre o navegador Chrome com o zoom definido via --force-device-scale-factor.
# #     [Arguments]    ${SITE_HOT}     ${zoom_fator}=1.0
# #     ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
# #     ${zoom arg}=    Catenate    SEPARATOR=    --force-device-scale-factor=    ${zoom_fator}
# #     Call Method    ${chrome options}    add_argument    ${zoom arg}
# #     Create WebDriver    Chrome    options=${chrome options}
# #     Maximize Browser Window
# #     Go To    ${SITE_HOT} 

# #     # QUANDO informa email válido
# #     Wait Until Element Is Visible      ${FIELD_EMAIL}
# #     Click Element    ${FIELD_EMAIL}
# #     Input Text       ${FIELD_EMAIL}    ${EMAIL}
# #     Sleep    2s

# #     # E informa senha válida
# #     Click Element    ${FIELD_SENHA}
# #     Input Text       ${FIELD_SENHA}    ${SENHA}
# #     # Sleep  5s
# #     Capture Page Screenshot
# #     # E clica na funcionalidade Entrar
# #     Wait Until Element Contains    ${BUTTON_ENTRAR}    Entrar
# #     Click Element                  ${BUTTON_ENTRAR}
# #     # Capture Page Screenshot        ${OUTPUTDIR}/selenium-screenshot-1.png


#     # Wait Until Element Contains    ${popup_aviso}      Aviso
#     # Sleep  10s
#     # Capture Page Screenshot
#     # Click Button     ${AVISO_OK}


#     Click Element    ${MENUS_HOT}
    
#     Wait Until Element Is Visible    ${MENUS_HOT}    
#     Scroll Element Into View         ${MENUS_HOT}  
#     Sleep  5s
#     Capture Page Screenshot  
#     Click Element                    ${SUBMENUS_NOVA_DEMANDA}    
    
        
#     # Click Element    # ${SUBMENUS_GESTAO_DEMANDA}
#     # Click Element    ${submenus_nova_demandas}
#     # Sleep  3s
#     # Capture Page Screenshot
#     # Click Element      ${SUBMENUS_LISTAR_DEMANDA}
#     Sleep  3s
#     Capture Page Screenshot
#     # Capture Element Screenshot    ${submenus_listar_demanda}
#     # Input Text       ${BUSCA_DEMANDA}     ${COD_DEMANDA}
#     Sleep    5s
#     Capture Page Screenshot
#     # Close All Browsers
