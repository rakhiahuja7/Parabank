*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Run Keywords
...    Setup API
...    AND    Login To Parabank
...    AND    Get Customer Accounts


*** Test Cases ***
Verify GET Account Balance Returns Valid Value
    [Documentation]    Verify GET /accounts/{id} returns 200 and valid balance

    ${account_id}=    Get From List    ${ACCOUNT_LIST}    0

    ${balance}=    Get Account Balance    ${account_id}

    Should Not Be Empty    ${balance}
    Log To Console    Balance for ${account_id} = ${balance}