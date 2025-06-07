*** Settings ***
# Library        ../Librarys
# Resource       ../Resources/google-resource.robot 
#Library        SeleniumLibrary


#direciona para o arquivo "login-resource.robot" com passos de testes localizado no diretório "Resource"
Resource       ../BPWEB/Resources/ExeLogin-resource.robot 



*** Test Cases ***

# [Documentation]    Suite de teste do site HOT  
CT-1: Logar com sucesso no HOT
    Executar Suite de Testes de Login
    