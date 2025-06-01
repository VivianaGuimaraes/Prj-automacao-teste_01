*** Settings ***
# # Library        ../Librarys
# Resource       ../Resources/google-resource.robot 
Resource       ../Resources/google-resource.robot 


*** Test Cases ***

# [Documentation]    Suite de teste do site Google   
CT-1: Logar com sucesso no GOOGLE
    DADO que usuario que acessa o site do GOOGLE
    