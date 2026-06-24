*** Settings ***
Resource    ../../resources/pages/TransferFundPage.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Verify System Rejects zero Transfer Amount
    [Documentation]  This test case verifies that system rejects transfer with 0 amount values.
    [Tags]    Defect

    Skip    Skipping the case because of BUG-01
    Register User Or Login User

    Click Transfer Funds Button
    Sleep    5s

    Enter Amount    0
    Select from Account    0
    Select to Account    1
    Click Transfer Button
    Sleep    5s
    Page Should Contain    ${transfer_error}


