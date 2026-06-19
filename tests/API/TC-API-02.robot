*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Run Keywords
...    Setup API
...    AND    Login To Parabank


*** Test Cases ***
Verify GET Customer Accounts Returns 200 With Accounts List
    [Documentation]    Verify GET /customers/{id}/accounts returns 200 with accounts list

    Get Customer Accounts

    Should Be Equal As Integers    ${STATUS_CODE}    200
    Should Not Be Empty            ${ACCOUNT_LIST}