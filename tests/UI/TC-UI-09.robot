*** Settings ***
Resource    ../../resources/pages/TransferFundPage.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Variables ***
${amount}

*** Test Cases ***
Transfer with Empty Amount Field

    [Documentation]  This test case verifies that system prevents submission when amount field is empty.

    Register User Or Login User

    Click Transfer Funds Button
    Sleep    5s

    Enter Amount    ${amount}
    Select from Account    0
    Select to Account    1
    Click Transfer Button
    Sleep    5s
    Verify failed Transaction


