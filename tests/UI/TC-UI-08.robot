*** Settings ***
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/keywords/common_keywords.robot


Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***

Login with Empty Password or Username
    [Documentation]  This test case verifies that system rejects login when password or Username field is blank.

    Login With Empty Password or Username  1234

    Sleep    5s

    Verify Login Failed


