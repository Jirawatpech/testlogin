*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary

Suite Setup       Open Browser  ${BASE URL}  ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${BASE URL}       http://localhost:8000
${BROWSER}        Chrome
${EMAIL}          sss@gmail.com
${PASSWORD}       12345

*** Test Cases ***
Test Login Success
    [Documentation]  Test successful login
    [Tags]           login
    Go To            ${BASE URL}/login
    Input Text       name=email  ${EMAIL}
    Input Text       name=password  ${PASSWORD}
    Click Button     name=login
    Wait Until Page Contains  Welcom to Store
    [Teardown]       Logout

Test Login Failure
    [Documentation]  Test failed login
    [Tags]           login
    Go To            ${BASE URL}/login
    Input Text       name=email  ${EMAIL}
    Input Text       name=password  wrongpassword
    Click Button     name=login
    Wait Until Page Contains  Invalid
    ${error_message}  Get Text  css=.alert-danger
    Should Be Equal  ${error_message}  Invalid !!
    
Test Logout
    [Documentation]  Test successful logout
    [Tags]           logout
    Go To            ${BASE URL}/logout
    Wait Until Page Contains  Login

*** Keywords ***
Logout
    [Documentation]  Logout user
    Go To  ${BASE URL}/logout
    Wait Until Page Contains  Login