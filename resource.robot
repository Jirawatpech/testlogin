*** Settings ***
Library  Selenium2Library

*** Variables ***
${BROWSER} =  gc
${URL} =  https://www.linkedin.com/
${FIRST_NAME} =  xpath=//*[@id="reg-firstname"]
${LAST_NAME} =  xpath=//*[@id="reg-lastname"]
${PHONE_NUMBER} =  xpath=//*[@id="reg-email"]
${PASSWORD} =  xpath=//*[@id="reg-password"]



*** Keywords ***

FIRST_NAME
    input text  ${FIRST_NAME}


LAST_NAME
    input text  ${LAST_NAME}


PHONE_NUMBER
    input text  ${PHONE_NUMBER}

PASSWORD
    input text  ${PASSWORD}