*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${URL}          http://localhost:8000/signup
${fname}        users        
${lname}        name
${phone}        0123456789
${email}        example@mail.com
${password}     12345

*** Test Cases ***
Register User
    Open Browser    ${URL}    ${BROWSER}
    Input Text      name=firstname    ${fname}
    Input Text      name=lastname     ${lname}
    Input Text      name=phone        ${phone}
    Input Text      name=email        ${email}
    Input Text      name=password     password123
    Click Element   name=Login
    Close Browser
Register firstname failed
    Open Browser    ${URL}    ${BROWSER}
    Input Text        name=lastname    ${lname}
    Input Text        name=phone       ${phone}
    Input Text        name=email       ${email}
    Input Text        name=password    12345678
    Click Button      name=Login
    ${error_message}  Get Text  css=.alert-danger
    Should Be Equal  ${error_message}  Please Enter your First Name !!
    Close Browser

Register lastname failed
    Open Browser    ${URL}    ${BROWSER}
    Input Text        name=firstname   ${fname}
    Input Text        name=phone       ${phone}
    Input Text        name=email       ${email}
    Input Text        name=password    12345678
    Click Button      name=Login
    ${error_message}  Get Text  css=.alert-danger
    Should Be Equal  ${error_message}  Please Enter your Last Name
    Close Browser

Register password worng failed
    Open Browser    ${URL}    ${BROWSER}
    Input Text        name=firstname   ${fname}
    Input Text        name=lastname    ${lname}
    Input Text        name=phone       ${phone}
    Input Text        name=email       ${email}
    Input Text        name=password    123
    Click Button      name=Login
    ${error_message}  Get Text  css=.alert-danger
    Should Be Equal  ${error_message}  Password must be 5 char long
    Close Browser

Register emailsame worng failed
    Open Browser    ${URL}    ${BROWSER}
    Input Text        name=firstname   ${fname}
    Input Text        name=lastname    ${lname}
    Input Text        name=phone       ${phone}
    Input Text        name=email       ${email}
    Input Text        name=password    123555
    Click Button      name=Login
    ${error_message}  Get Text  css=.alert-danger
    Should Be Equal  ${error_message}  Email Address Already Registered..
    Close Browser
    