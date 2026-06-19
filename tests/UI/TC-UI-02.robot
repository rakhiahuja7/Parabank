*** Settings ***
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***

Successful Login with Valid Credentials
    [Documentation]  This test case verifies that a user name login successfully with valid credentials.

    Login With Valid Credentials   john   demo
    



