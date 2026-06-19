*** Settings ***
Resource    ../../resources/pages/RegisterPage.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application



*** Test Cases ***

Successful User Registration
    [Documentation]  This test case verifies that a user can register successfully.

    Register a new user



