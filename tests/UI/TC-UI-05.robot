*** Settings ***
Resource    ../../resources/pages/TransferFundPage.robot
Resource    ../../resources/keywords/common_keywords.robot


Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Transfer Funds Between Accounts Successfully
    [Documentation]  This test case verifies that user can transfer funds and receives confirmation.

    Register User Or Login User

    Click Transfer Funds Button
    Sleep    5s

    Enter Amount    5
    Select from Account    0
    Select to Account    1
    Click Transfer Button
    Sleep    5s
    Verify Successful Transaction


