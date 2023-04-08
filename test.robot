*** Settings ***
Documentation  Testing
Library  Selenium2Library
Library    BuiltIn


*** Variables ***


*** Test Cases ***
login Susscess
    Open Browser        about:blank       chrome
    Go to       http://127.0.0.1:8000/login     
    Input text      name=email      sss@gmail.com
    Input text      name=password   12345
    Click Button    Login 
Login ผิดพลาด จะต้องแสดงข้อความ Error    
    Open Browser        about:blank       chrome
    Go to       http://127.0.0.1:8000/login     
    Input text      name=email      sss@gmail.com
    Input text      name=password   123456
    Click Button    Login
    ${error_message}=    Get Alert Message
    Should Be Equal As Strings    ${error_message}    Invalid !!
Login ด้วย User ที่ไม่ถูกต้อง จะต้องแสดงข้อความ Error
    Login ผิดพลาด จะต้องแสดงข้อความ Error    invalid    ${VALID PASSWORD}    User/Password ไม่ถูกต้อง 
*** Keywords ***
