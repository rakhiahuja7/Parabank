*** Settings ***
Library     SeleniumLibrary
Library       ../../config/environment.py
Resource    ../pages/RegisterPage.robot
Resource    ../pages/LoginPage.robot
Resource    ../pages/OpenAccountPage.robot
Resource    ../pages/TransferFundPage.robot



*** Variables ***
${BROWSER}  chrome
${ENV}  qa


*** Keywords ***
Load Environment
    [Documentation]    Loads environment configuration
    Load Env    ${ENV}
    ${url}=              Get Env    baseurl

    Set Global Variable    ${BASE_URL}      ${url}

Open Application
    [Documentation]  Opening the application
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window

Close Application
    [Documentation]  Closing the application
    Close All Browsers


Try Login

    Enter Username    john
    Enter Password    demo
    Click Login Button

    ${login_success}=    Run Keyword And Return Status
    ...    Verify Successful Login

    RETURN    ${login_success}

Register User Or Login User

    ${login_success}=    Try Login

    IF    not ${login_success}
        Register a new user
    END

Create New Savings Bank Account Successfully


    Register User Or Login User

    Click Open New Account Button
    Sleep    5s

    Select Account Type as Savings
    Select Existing Account
    Click Open Account Button Final
    Sleep    5s
    Verify Successful Account Creation

Transfer Funds Between Accounts Successfully

    Click Transfer Funds Button
    Sleep    5s

    Enter Amount    5
    Select from Account    0
    Select to Account    1
    Click Transfer Button
    Sleep    5s
    Verify Successful Transaction



