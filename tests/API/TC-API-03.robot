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
Verify POST Transfer Funds Via API
    [Documentation]    Verify POST /transfer executes fund transfer and returns success

    Transfer Funds    10

    Should Be Equal As Integers    ${STATUS_CODE}    200
    Log To Console    Transfer executed successfully