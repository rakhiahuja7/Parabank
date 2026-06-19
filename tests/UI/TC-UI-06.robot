*** Settings ***
Resource    ../../resources/pages/TransferFundPage.robot
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Verify System Rejects Invalid Transfer Amount
    [Documentation]  This test case verifies that system rejects transfer with invalid amount values.

    Register User Or Login User

    Click Transfer Funds Button
    Sleep    5s

    Enter Amount    abc
    Select from Account    0
    Select to Account    1
    Click Transfer Button
    Sleep    5s
    Verify failed Transaction


