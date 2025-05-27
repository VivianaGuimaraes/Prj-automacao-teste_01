*** Setting ***

# Library        SeleniumLibrary
# Library        OperatingSystem
Resource       ../Resources/Library-suites.robot



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
${site_test}         https://hotcorphml.globalhitss.com.br/login/
${field_email}       name:username
${email}             viviana.guimaraes@globalhitss.com.br
${field_senha}       name:password
${senha}             Mudar@2025
${button_entrar}     id:login_submit
${OUTPUTDIR}         ../results
${popup_aviso}       id:ModalLabel1
${aviso_ok}          xpath=//button[text()='OK']






*** Keywords ***

#CT-1: Logar com sucesso no HOT

DADO que usuario que acessa o site do HOT
    Open Browser    ${site_test}    Chrome
    #Maximize Browser Window
    

QUANDO informa email válido 
    Wait Until Element Is Visible   ${field_email}    
    Click Element    ${field_email}
    Input Text       ${field_email}    ${email}    
    Sleep    10s    
E informa senha válida
    Click Element    ${field_senha}
    Input Text       ${field_senha}    ${senha}
    #Sleep  5s 
    Capture Page Screenshot
E clica na funcionalidade Entrar
    Wait Until Element Contains    ${button_entrar}    Entrar
    Click Element                  ${button_entrar}
    # Capture Page Screenshot        ${OUTPUTDIR}/selenium-screenshot-1.png
    
    Wait Until Element Contains    ${popup_aviso}      Aviso
    #Click Element                  ${aviso_ok}
    Sleep  5s 
    Capture Page Screenshot 
    #Sleep  10s 
        # ENTÃO sistema carrega interface inicial do HOT



