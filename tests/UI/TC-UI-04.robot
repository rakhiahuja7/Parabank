*** Settings ***
Resource    ../../resources/pages/OpenAccountPage.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***


Create New Savings Bank Account Successfully

    [Documentation]  This test case verifies that a logged-in user can create a new bank account.

    Register User Or Login User

    Click Open New Account Button
    Sleep    5s

    Select Account Type as Savings
    Select Existing Account
    Click Open Account Button Final
    Sleep    5s
    Verify Successful Account Creation




