*** Settings ***
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***

Login with Empty Password and Username
    [Documentation]  This test case verifies that system rejects login when password and username field is blank.

    Login With Empty Password and Username

    Sleep    5s

    Verify Login Failed


