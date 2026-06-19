*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Run Keywords
...    Load Environment
...    AND    Setup API


*** Test Cases ***
Validate Updated Balances Using API After UI Transfer

    Open Application
    Login To Parabank

    Create New Savings Bank Account Successfully

    Get Customer Accounts

    ${account_a}=    Get From List    ${ACCOUNT_LIST}    0
    ${account_b}=    Set Variable If    len(${ACCOUNT_LIST}) > 1    ${ACCOUNT_LIST}[1]    ${ACCOUNT_LIST}[0]

    Log To Console    SOURCE = ${account_a}
    Log To Console    DEST = ${account_b}

    ${before_a}=    Get Account Balance    ${account_a}
    ${before_b}=    Get Account Balance    ${account_b}

    Log To Console    BEFORE A = ${before_a}
    Log To Console    BEFORE B = ${before_b}


    ${amount}=    Set Variable    5
    Transfer Funds Between Accounts Successfully

    ${after_a}=    Get Account Balance    ${account_a}
    ${after_b}=    Get Account Balance    ${account_b}

    Log To Console    AFTER A = ${after_a}
    Log To Console    AFTER B = ${after_b}


    ${expected_a}=    Evaluate    float(${before_a}) - ${amount}
    ${expected_b}=    Evaluate    float(${before_b}) + ${amount}

    Should Be Equal As Numbers    ${after_a}    ${expected_a}
    Should Be Equal As Numbers    ${after_b}    ${expected_b}

    Log To Console    BALANCE VALIDATION SUCCESSFUL