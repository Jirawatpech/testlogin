*** Settings ***
Library  Selenium2Library
Resource  resource.robot

*** Variables ***

@{TEST_DATA} =  fname  lname  9734565432  abcdefgh@3
@{TEST_DATA1} =  lname  fname  8756454456  sadsadef#1

*** Test Cases ***

open linkedin
    [Tags]  linkedin
    open browser  about:blank  ${BROWSER}
    maximize browser window
    go to  ${URL}

add entries
    resource.FIRST_NAME  @{TEST_DATA}[0]
    resource.LAST_NAME  @{TEST_DATA}[4]
    resource.PHONE_NUMBER  @{TEST_DATA}[4]
    resource.PASSWORD  @{TEST_DATA}[4]

close Linkedin
    close all browsers