*** Settings ***
# Library        ../Librarys
# Resource       ../Resources/google-resource.robot 
#Library        SeleniumLibrary


#direciona para o arquivo "login-resource.robot" com passos de testes localizado no diretório "Resource"
Resource       ../Resources/login-resource.robot 



*** Test Cases ***

# [Documentation]    Suite de teste do site HOT  
CT-1: Logar com sucesso no HOT
    DADO que usuario que acessa o site do HOT
    QUANDO informa email válido 
    E informa senha válida
    E clica na funcionalidade Entrar
    
        




