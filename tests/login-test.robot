***Setting***
Library        SeleniumLibrary
Resource       ../Resources/Login-keywords.robot 

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


# *** Variables ***
# ${site_test}     https://demoqa.com/automation-practice-form

# ${primeiro_nome}    //*[@id="firstName"] 


*** Test Cases ***
CT-1: Logar com sucesso no HOT
    DADO que usuario que acessa o site do HOT
    QUANDO informa email válido 
    E informa senha válida
    E clica na funcionalidade Entrar
        
    



