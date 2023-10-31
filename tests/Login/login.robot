Language: Brazilian Portuguese

*** Settings ***
Documentation    Automação de Testes de Formulário de Registro com Robot Framework

Library    FakerLibrary  locale=pt_BR

Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/login_keyworks.robot

Suite Setup       Abrir o site da Thinking Test Center
Suite Teardown    Fechar Browser

*** Test Cases ***
Cenário 1: Deve realizar login com sucesso
    Dado que o usuário esteja na página do Automationtesting
    Quando inserir dados válidos para cadastro
    Então o usuário deve ser cadastrado com sucesso

Cenário 2: Deve exibir erro ao não preencher campos obrigatórios
    Dado que o usuário esteja na página do Automationtesting
    Quando deixar dados em branco para cadastro
    Então deve ser exibido alerta com erro
Cenário 3: Deve exibir erro ao inserir dados inválidos
    Dado que o usuário esteja na página do Automationtesting
    Quando preencher campos de cadastro com dados inválidos
    Então deve ser exibido alerta de erro
Cenário 4: Deve exibir erro ao preencher com numero de caracteres maior que 20
    Dado que o usuário esteja na página do Automationtesting
    Quando preencher campos de cadastro com 21 caracteres
    Então deve ser exibido alerta de erro de caracteres


        



