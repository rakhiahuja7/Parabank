*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Run Keywords
...    Load Environment
...    AND    Setup API


*** Test Cases ***
Validate New Account Exists in API After UI Creation

    Open Application

    Login To Parabank

    Get Customer Accounts
    ${before_list}=    Copy List    ${ACCOUNT_LIST}

    Log To Console    BEFORE ACCOUNTS = ${before_list}

    Create New Savings Bank Account Successfully

    Wait Until Element Is Visible    id=newAccountId    15s
    ${new_account_id}=    Get Text    id=newAccountId

    Log To Console    NEW ACCOUNT ID = ${new_account_id}

    Get Customer Accounts
    ${after_list}=    Copy List    ${ACCOUNT_LIST}

    Log To Console    AFTER ACCOUNTS = ${after_list}


    List Should Contain Value    ${after_list}    ${new_account_id}

    ${before_count}=    Get Length    ${before_list}
    ${after_count}=     Get Length    ${after_list}

    Should Be True    ${after_count} > ${before_count}

    Log To Console    NEW ACCOUNT VERIFIED SUCCESSFULLY IN API