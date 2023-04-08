*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}  http://127.0.0.1:8000/
${WAIT TIME}  5s
${STORE LINK}       ${URL}/store
${CART LINK}        ${URL}/cart
${SIGNUP LINK}      ${URL}/signup
${LOGIN LINK}       ${URL}/login

*** Test Cases ***
Test Navigation Bar
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://a[@href='/store']
    Click Link    xpath://a[@href='/store']
    Wait Until Page Contains Element    xpath://a[@href='/cart']
    Click Link    xpath://a[@href='/cart']
    Wait Until Page Contains Element    xpath://a[@href='/signup']
    Click Link    xpath://a[@href='/signup']
    Wait Until Page Contains Element    xpath://a[@href='/login']
    Click Link    xpath://a[@href='/login']
    Close Browser

    