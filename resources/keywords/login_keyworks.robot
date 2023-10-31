*** Settings ***
Documentation    Keywords para login

Library    FakerLibrary    locale=pt_BR

Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/locators/login_locators.robot

*** Keywords ***
Clicar para cadastrar conta
    Click If Element Is Visible    ${BTN_SIGNUP}
Adicionar dados para cadastro
    [Arguments]    ${firstName}    ${lastName}    ${email}    ${password}

    Input Text If Element Is Visible    ${INPUT_FIRSTNAME}    ${firstName}
    Input Text If Element Is Visible    ${INPUT_LASTNAME}    ${lastName}
    Input Text If Element Is Visible    ${INPUT_EMAIL}       ${email}
    Input Text If Element Is Visible    ${INPUT_PASSWORD}    ${password}    
    Click If Element Is Visible         ${BTN_SUBMIT}  

Validar se usuário é redirecionado para contact list
    [Arguments]    ${text}     
    Wait Until Element Is Visible       ${BTN_LOGOUT}
    Get Text    ${HEADER}
    Element Text Should Be    ${HEADER}    ${text}
Validar se botão de logout é exibido
    Element Should Be Visible       ${BTN_LOGOUT}
    Click If Element Is Visible     ${BTN_LOGOUT}
Clicar em enviar com dados em branco
    Click If Element Is Visible       ${BTN_SUBMIT} 
    Click If Element Is Visible       ${BTN_SUBMIT} 
Verificar se exibe alerta com erro  
    [Arguments]    ${text}
    Click If Element Is Visible         ${BTN_SUBMIT}  
    Element Text Should Be    ${ERROR_ALERT}    ${text}
Deve cancelar cadastro
    Click If Element Is Visible    ${BTN_CANCEL}

## GHERKIN STEPS ##

Dado que o usuário esteja na página do Automationtesting
    Title Should Be    Contact List App
    Clicar para cadastrar conta
Quando inserir dados válidos para cadastro
    ${firstName}=    FakerLibrary.First Name
    ${lastName}=    FakerLibrary.Last Name
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password

    Adicionar dados para cadastro    ${firstName}    ${lastName}    ${email}    ${password}
Então o usuário deve ser cadastrado com sucesso
    Validar se usuário é redirecionado para contact list        Click on any contact to view the Contact Details
    Validar se botão de logout é exibido
Quando deixar dados em branco para cadastro
    Clicar em enviar com dados em branco
Então deve ser exibido alerta com erro  
    Verificar se exibe alerta com erro                          User validation failed: firstName: Path `firstName` is required., lastName: Path `lastName` is required., email: Email is invalid, password: Path `password` is required.
    Deve cancelar cadastro
Quando preencher campos de cadastro com dados inválidos
    Adicionar dados para cadastro                               ç    ç    ç    ç       
Então deve ser exibido alerta de erro
    Verificar se exibe alerta com erro                          User validation failed: email: Email is invalid, password: Path `password` (`ç`) is shorter than the minimum allowed length (7).   
    Deve cancelar cadastro   
Quando preencher campos de cadastro com 21 caracteres
    Adicionar dados para cadastro                               abcdefghijlmnopqrstug    abcdefghijlmnopqrstug    abcdefghijlmnopqrstug@gmail.com    abcdefghijlmnopqrstug   
Então deve ser exibido alerta de erro de caracteres
    Verificar se exibe alerta com erro                          User validation failed: firstName: Path `firstName` (`abcdefghijlmnopqrstug`) is longer than the maximum allowed length (20)., lastName: Path `lastName` (`abcdefghijlmnopqrstug`) is longer than the maximum allowed length (20).          





