*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Run Keywords
...    Load Environment
...    AND    Setup API


*** Test Cases ***
API Returns Updated Balance After Fund Transfer Via UI

    Open Application

    Create New Savings Bank Account Successfully

    Login To Parabank
    Wait Until Page Contains Element  id=newAccountId  10s
    ${ui_account_id}=  Get Text  id=newAccountId

    Log To Console    UI ACCOUNT ID = ${ui_account_id}

    Get Customer Accounts

    ${account_a}=    Get From List    ${ACCOUNT_LIST}    0
    ${account_b}=    Set Variable If    len(${ACCOUNT_LIST}) > 1    ${ACCOUNT_LIST}[1]    ${ACCOUNT_LIST}[0]

    ${before_a}=    Get Account Balance    ${account_a}
    ${before_b}=    Get Account Balance    ${account_b}

    Transfer Funds Between Accounts Successfully

    ${after_a}=    Get Account Balance    ${account_a}
    ${after_b}=    Get Account Balance    ${account_b}

    Should Be True    ${after_a} < ${before_a}
    Should Be True    ${after_b} > ${before_b}