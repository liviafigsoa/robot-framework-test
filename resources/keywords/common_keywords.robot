*** Settings ***
Documentation    Arquivo com as keywords comuns do projeto

Library    SeleniumLibrary

*** Variables ***
${LOGIN URL}            https://thinking-tester-contact-list.herokuapp.com
${BROWSER}              Chrome
${BROWSER_OPTIONS}      add_experimental_option('excludeSwitches', ['enable-logging']);add_argument('--disable-dev-shm-usage');add_argument("--disable-popup-blocking");add_argument("--ignore-certificate-errors")

*** Keywords ***
Abrir o site da Thinking Test Center
    Open Browser        ${LOGIN URL}    ${BROWSER}    options=${BROWSER_OPTIONS}
    Maximize Browser Window
    Title Should Be    Contact List App

Fechar Browser
    Close Browser

Mouse Over If Element Is Visible
    [Arguments]    ${element_locator}

    Wait Until Element Is Visible    ${element_locator}
    Mouse Over    ${element_locator}

Click If Element Is Visible
    [Arguments]    ${element_locator}
    
    Mouse Over If Element Is Visible    ${element_locator}
    Click Element    ${element_locator}

Input Text If Element Is Visible
    [Arguments]    ${element_locator}    ${text}

    Wait Until Element Is Visible    ${element_locator}
    Input Text    ${element_locator}    ${text}
