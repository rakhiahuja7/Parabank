*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Setup API

*** Test Cases ***
Login and Fetch Customer ID via API
    [Documentation]    Verify login API returns customer ID

    Login To Parabank
    Should Not Be Empty    ${CUSTOMER_ID}
    Log To Console    Customer ID = ${CUSTOMER_ID}
