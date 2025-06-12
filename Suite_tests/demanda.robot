*** Settings ***
# direciona para o arquivo "login-resource.robot" com passos de testes localizado no diretório "Resource"
Resource       ../GEST-DEMANDAS/Resources/ExeLogin-resource.robot

*** Test Cases ***
CT-1: Logar com sucesso no HOT
        Executar suite de teste