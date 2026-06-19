*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Run Keywords
...    Load Environment
...    AND    Setup API


*** Test Cases ***
Validate Account Type And Details In API After UI Creation

    Open Application

    Create New Savings Bank Account Successfully

    Wait Until Page Contains Element    id=newAccountId    10s
    ${ui_account_id}=    Get Text    id=newAccountId

    ${ui_account_type}=    Set Variable    SAVINGS

    Log To Console    UI ACCOUNT ID = ${ui_account_id}

    ${response}=    Get On Session    parabank    /accounts/${ui_account_id}

    Should Be Equal As Integers    ${response.status_code}    200

    ${xml}=    Parse XML    ${response.text}

    ${api_id}=        Get Element Text    ${xml}    id
    ${api_type}=      Get Element Text    ${xml}    type
    ${api_customer}=  Get Element Text    ${xml}    customerId
    ${api_balance}=   Get Element Text    ${xml}    balance

    Should Be Equal    ${api_id}      ${ui_account_id}
    Should Be Equal    ${api_type}    ${ui_account_type}

    Log To Console    UI and API match successful
    Log To Console    API TYPE = ${api_type}
    Log To Console    API BALANCE = ${api_balance}