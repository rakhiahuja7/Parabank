*** Settings ***
Library    SeleniumLibrary

Resource    ../../locators/transferFunds_locators.robot

*** Keywords ***

Click Transfer Funds Button
    Wait Until Element Is Visible    ${transferFunds_button}    20s
    Click Element    ${transferFunds_button}
    
Enter Amount
    [Arguments]    ${amount}
    Input Text    ${amount_input}    ${amount}
    
Select From Account
    [Arguments]    ${from_account_index}
    Select From List By Index    ${from_account_dropdown}    ${from_account_index}

Select To Account
    [Arguments]    ${to_account_index}
    Select From List By Index    ${to_account_dropdown}    ${to_account_index}

Click Transfer Button
    Click Element    ${transfer_button}

Verify Successful Transaction
    Wait Until Element Is Visible    ${transfer_confirmation}    30s

Verify failed Transaction
    Wait Until Element Is Visible    ${transfer_error}    30s



