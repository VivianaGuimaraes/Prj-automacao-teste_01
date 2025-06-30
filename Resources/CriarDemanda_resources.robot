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

# Formulário - PROSPECÇÃO: Criar Demanda
${FIELD_F1_CLASSIFICACAO}                           //*[@id="classification"]
${CLASSIFICACAO_OPORTUNIDADE}                      //*[@id="classification"]/option[text()="OPORTUNIDADE"]
${POPUP_CLASSIFICAO_OPORTUNIDADE}                 //h1[text()="Esta Oportunidade se trata de um projeto legado?"]
${POPUP_CLASSIFICAO_OPOTUNIDADE_NAO}             //button[@id="close_legacy_modal"]  
# ${POPUP_CLASSIFICAO_OPOTUNIDADE_SIM}            //button[@id="is_legacy"]
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
${FIELD_F1_DESCRICAO}                        //*[@id="description"]
${SUBMETER_FASE}                            //*[@id="btn_save_all"]

# Formulário - PROSPECÇÃO: Adotar Demanda
${FIELD_F2_DIRETORIA_HITSS}                   //*[@id="hitss_director"]/option[3]
${FIELD_F2_RESP_AREA_HITSS}                  //*[@id="hitss_manager"]/option[14]
${FIELD_F3_TORRE_HITSS}                     //*[@id="hitss_tower"]/option[3]
${FIELD_F2_RESP_DERIVERY}                  //*[@id="delivery_owner"]/option[3]
${FIELD_F2_RESP_DEVENGADO}                 //*[@id="owner_accurate"]/option[16]


# Formulário - PROSPECÇÃO: Definir Prioridade
${FIELD_F3_SINALIZADOR_PRIORIDADE}        //*[@id="priority"]/option[2]
${FIELD_F3_LIDER_TECNICO}                 //*[@id="technical_owner"]/option[2]


# Formulário - PROP. TÉCNICA: Definir Complexidade
${FIELD_F4_SINALIZADOR_COMPLEXIDADE}      //*[@id="complexity"]/option[3]
${FIELD_F4_LOCAL_EXECUCAO}                //*[@id="execution_location"]/option[20]  #[20]=Rio de Janeiro
${FIELD_F4_SEDE}                          //*[@id="sede"]/option[2]
${FIELD_F4_TIPO_DEVENGADO}               //*[@id="accurate_type"]/option[2]         #[2]=Alocação de Recurso

#Preenche formulario Prospecção - Elaborar Solução - PT/PC
${FIELD_F5_NUMERO-PPM}                  //*[@id="ppm_number"]



${SUBMENUS_LISTAR_DEMANDA}               //a[contains(text(), 'Listar Demandas')]
${BUSCA_DEMANDA}                        //*[@id='search_demand']
${COD_DEMANDA}                           NRJCLA2670




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
    Input Text                     ${FIELD_F1_TITULO_DEMANDA}     PV
    Click Element                  ${TITULO_DEMANDA_NOME_SELECAO}
    Sleep  1s    
    Click Element                  ${FIELD_F1_CLIENTE}  
    Sleep  1s
    Click Element                  ${FIELD_F1_DIRETORIA_CLIENTE}
    Sleep  1s 
    Click Element                  ${FIELD_F1_GERENTE_CLIENTE} 
    Sleep  1s
    Click Element                  ${FIEDL_F1_LIDER_TEC_CLIENTE}   
    Sleep  1s              
    Click Element                  ${FIELD_F1_HORIZONTAL_VERTICAL}               
    Click Element                  ${FIELD_F1_SEGMENTO}   
    Input Text                     ${FIELD_F1_DT_INICIO_PROJ}       26/06/2025 
    Click Element                  ${FIELD_F1_TIPO_CONTRATACAO} 
    Sleep  1s
    Log                            ${CAMINHO_ARQUIVO}  
    File Should Exist              ${CAMINHO_ARQUIVO}
    Choose File                    ${FIELD_F1_ANEXAR_ARQUIVO}     ${CAMINHO_ARQUIVO}
    Input Text                     ${FIELD_F1_DESCRICAO}  DEMANDA OPORTUNIDADE SEM LPU
    Capture Page Screenshot  
    Scroll Element Into View       ${SUBMETER_FASE}
    Click Button                   ${SUBMETER_FASE}
    Capture Page Screenshot 
    Sleep  2s 
    Capture Page Screenshot 
    Sleep  5s
    
    ${fase} =    Get Text          //div[@class="actual_phase"] 
    IF     '${fase}' == 'Fase Atual: Adotar Demanda'
    Log    Demanda criada com sucesso! \n PROSPECÇÃO -> ${fase}
    ELSE
    Log    Fase atual inválida: ${fase}
    Fail   Fase incorreta.
    END
    
Preenche formulario Prospecção - Adotar Demanda 

    Click Element                   ${FIELD_F2_DIRETORIA_HITSS}    
    Sleep  1s               
    Click Element                   ${FIELD_F2_RESP_AREA_HITSS}                 
    Sleep  1s
    Click Element                   ${FIELD_F3_TORRE_HITSS} 
    Sleep  1s                    
    Click Element                   ${FIELD_F2_RESP_DERIVERY}       
    Sleep  1s   
    Click Element                   ${FIELD_F2_RESP_DEVENGADO} 
    Capture Page Screenshot  
    Scroll Element Into View        ${SUBMETER_FASE}
    Click Button                    ${SUBMETER_FASE}
    Capture Page Screenshot 
    Sleep  5s 
    Capture Page Screenshot  

    ${fase_2} =    Get Text          //div[@class="actual_phase"] 
    IF     '${fase_2}' == 'Fase Atual: Definir Prioridade'
    Log    Fase da demanda alterada com sucesso! \n PROSPECÇÃO -> ${fase_2}
    ELSE
    Log    Fase atual inválida: ${fase_2}
    Fail   Fase incorreta.
    END

Preenche formulario Prospecção - Definir Prioridade  

    Click Element                    ${FIELD_F3_SINALIZADOR_PRIORIDADE}
    Sleep  1s
    Click Element                    ${FIELD_F3_LIDER_TECNICO}
    Capture Page Screenshot  
    Scroll Element Into View         ${SUBMETER_FASE}
    Click Button                     ${SUBMETER_FASE}
    Capture Page Screenshot 
    Sleep  5s 
    Capture Page Screenshot
    
    ${fase_2} =    Get Text          //div[@class="actual_phase"] 
    IF     '${fase_2}' == 'Fase Atual: Definir Complexidade'
    Log    Fase da demanda alterada com sucesso! \n PROP. TÉCNICA -> ${fase_2}
    ELSE
    Log    Fase atual inválida: ${fase_2}
    Fail   Fase incorreta.
    END


Preenche formulario Prospecção - Definir Complexidade

    Click Element                   ${FIELD_F4_SINALIZADOR_COMPLEXIDADE}
    Sleep  1s
    Click Element                   ${FIELD_F4_LOCAL_EXECUCAO}
    Sleep  1s
    Click Element                   ${FIELD_F4_SEDE}
    Sleep  1s
    Click Element                   ${FIELD_F4_TIPO_DEVENGADO}
    Capture Page Screenshot  
    Scroll Element Into View         ${SUBMETER_FASE}
    Click Button                     ${SUBMETER_FASE}
    Capture Page Screenshot 
    Sleep  5s 
    Capture Page Screenshot

    ${fase_2} =    Get Text          //div[@class="actual_phase"] 
    IF     '${fase_2}' == 'Fase Atual: Elaborar Solução - PT/PC'
    Log    Fase da demanda alterada com sucesso! \n PROP. TÉCNICA -> ${fase_2}
    ELSE
    Log    Fase atual inválida: ${fase_2}
    Fail   Fase incorreta.
    END


Preenche formulario Prospecção - Elaborar Solução_PT-PC
    
    #Numero Com 5 Digitos Usando Evaluate
    ${numero}=    Evaluate    __import__('random').randint(10000, 99999)
    Log    Número inteiro com 5 dígitos: ${numero}
    Sleep  5s
    Input TexT    ${FIELD_F5_NUMERO-PPM}    ${numero}
    Sleep  2s
    Capture Page Screenshot
    Sleep  5s
    # Click Element    
    # Sleep  1s
    # Click Element    
    # Sleep  1s
    
    




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
