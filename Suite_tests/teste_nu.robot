*** Settings ***
Library    BuiltIn

*** Test Cases ***
Numero Com 5 Digitos Usando Evaluate
    ${numero}=    Evaluate    __import__('random').randint(10000, 99999)
    Log    Número inteiro com 5 dígitos: ${numero}