*** Settings ***

#Library        SeleniumLibrary
# Library        OperatingSystem
#Resource       ../Librarys/Library-suites.robot
#Resource        ../Prj-automacao-teste_01/Librarys/Library-suites.robot
#Library         SeleniumLibrary


#direciona para o arquivo "Libraries-suites.robot" que contém todoas as library necessárias para os testes
Resource        ../Resources/Libraries/Libraries-file_resources.robot


# *** Keywords ***
# abrir site do google
#     Open Browser    ${site_test}    Chrome
# preencher primeiro nome  
#     sleep         10s   
# ... click Elements    ${primeiro_nome}   
# ... Input Text        ${primeiro_nome}   Viviana
# ... 

# fechar navegador
#     sleep        50s
#     close Browser


*** Variables ***
${site_hot}                     https://hotcorphml.globalhitss.com.br/login/
${field_email}                   name:username
${email}                         viviana.guimaraes@globalhitss.com.br
${field_senha}                   name:password
${senha}                         Mudar@2025
${button_entrar}                 id:login_submit
${OUTPUTDIR}                     ../results
${popup_aviso}                   id:ModalLabel1
${aviso_ok}                      xpath=//button[text()='OK']
${menus_hot}                     //*[@class='navbar-toggler-icon']
${submenus_gestao_demanda}       //a[contains(text(), 'Gestão da Demanda')]   
${submenus_nova_demanda}         //a[contains(text(), 'Nova Demanda')]
${submenus_listar_demanda}       //a[contains(text(), 'Listar Demandas')]
${busca_demanda}                 //*[@id='search_demand']
${cod_demanda}                   NRJCLA2670
     

*** Keywords ***

#CT-1: Logar com sucesso no HOT
Executar Suite de Testes de Login
    Open Browser      ${site_hot}    Chrome   
    Maximize Browser Window
    

#QUANDO informa email válido 
    Wait Until Element Is Visible      ${field_email}    
    Click Element    ${field_email}
    Input Text       ${field_email}    ${email}    
    Sleep    2s    
#E informa senha válida
    Click Element    ${field_senha}
    Input Text       ${field_senha}    ${senha}
    #Sleep  5s 
    Capture Page Screenshot
#E clica na funcionalidade Entrar
    Wait Until Element Contains    ${button_entrar}    Entrar
    Click Element                  ${button_entrar}
    # Capture Page Screenshot        ${OUTPUTDIR}/selenium-screenshot-1.png
    
    Wait Until Element Contains    ${popup_aviso}      Aviso
    Sleep  3s 
    Capture Page Screenshot 
    Click Button     ${aviso_ok}
    Click Element    ${menus_hot}  
    Click Element    ${submenus_gestao_demanda}
    #Click Element    ${submenus_nova_demanda}  
    Sleep  3s 
    Capture Page Screenshot
    click Element    ${submenus_listar_demanda}
    Sleep  3s 
    Capture Page Screenshot
    #Capture Element Screenshot    ${submenus_listar_demanda}
    Input Text       ${busca_demanda}     ${cod_demanda}
    Sleep    5s
    Capture Page Screenshot
    Close Browser