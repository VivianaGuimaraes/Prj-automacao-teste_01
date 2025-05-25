***Setting***
Library        SeleniumLibrary
Library        OperatingSystem
Resource       ../Resources/Login-resource.robot 


*** Test Cases ***

CT-1: Logar com sucesso no HOT
    DADO que usuario que acessa o site do HOT
    QUANDO informa email válido 
    E informa senha válida
    E clica na funcionalidade Entrar
        
    



