*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     XML
Library     ../../config/environment.py


*** Keywords ***

Setup API
    Load Env    qa_api

    ${API_BASE_URL}=    Get Env    api_url
    ${USERNAME}=        Get Env    api_username
    ${PASSWORD}=        Get Env    api_password
    ${ACCOUNT_ID}=      Get Env    account_id

    Set Suite Variable    ${API_BASE_URL}
    Set Suite Variable    ${USERNAME}
    Set Suite Variable    ${PASSWORD}
    Set Suite Variable    ${ACCOUNT_ID}

    Create API Session


Create API Session
    Create Session    parabank    ${API_BASE_URL}    verify=False


Validate Status Code
    [Arguments]    ${response}    ${expected_code}

    Should Be Equal As Integers    ${response.status_code}    ${expected_code}


Login To Parabank
    ${response}=    Get On Session    parabank    /login/${USERNAME}/${PASSWORD}

    Validate Status Code    ${response}    200

    ${xml}=    Parse XML    ${response.text}
    ${customer_id}=    Get Element Text    ${xml}    id

    Set Suite Variable    ${CUSTOMER_ID}    ${customer_id}

    Log To Console    Customer ID = ${CUSTOMER_ID}


Get Customer Accounts
    ${response}=    Get On Session    parabank    /customers/${CUSTOMER_ID}/accounts

    Set Suite Variable    ${STATUS_CODE}    ${response.status_code}

    ${xml}=    Parse XML    ${response.text}

    ${accounts}=    Get Elements    ${xml}    xpath=.//account

    ${account_list}=    Create List

    FOR    ${acc}    IN    @{accounts}
        ${id}=    Get Element Text    ${acc}    xpath=id
        Append To List    ${account_list}    ${id}
    END

    Set Suite Variable    ${ACCOUNT_LIST}    ${account_list}


Transfer Funds
    [Arguments]    ${amount}

    ${from}=    Get From List    ${ACCOUNT_LIST}    0
    ${to}=      Get From List    ${ACCOUNT_LIST}    1

    ${params}=    Create Dictionary
    ...    fromAccountId=${from}
    ...    toAccountId=${to}
    ...    amount=${amount}

    ${response}=    Post On Session    parabank    /transfer    params=${params}

    Set Suite Variable    ${STATUS_CODE}    ${response.status_code}

    Log To Console    ${response.text}


Get Account Balance
    [Arguments]    ${account_id}

    ${response}=    Get On Session    parabank    /accounts/${account_id}

    ${xml}=    Parse XML    ${response.text}

    ${balance}=    Get Element Text    ${xml}    balance

    RETURN    ${balance}