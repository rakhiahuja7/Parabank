*** Settings ***
Library    SeleniumLibrary

Resource    ../../locators/OpenAccount_locators.robot

*** Keywords ***

Click Open New Account Button
    Wait Until Element Is Visible    ${OpenAccount}    20s
    Click Element    ${OpenAccount}

Select Account Type as Checking
    Select From List By Label    ${Account_type}    CHECKING

Select Account Type as Savings
    Select From List By Label    ${Account_type}    SAVINGS

Select Existing Account
    Select From List By Index   ${ChooseExistingAccount}    0

Click Open Account Button Final
    Click Element    ${OpenNewAccountButton}

Verify Successful Account Creation
    Wait Until Element Is Visible    ${AccountOpened}    30s


