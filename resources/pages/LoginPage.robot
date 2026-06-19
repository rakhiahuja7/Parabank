*** Settings ***
Library    SeleniumLibrary

Resource    ../../locators/login_locators.robot
Resource    ../../resources/keywords/common_keywords.robot

*** Keywords ***

Enter username
    [Arguments]    ${username}
    Input Text    ${username_input}    ${username}

Enter password
    [Arguments]    ${password}
    Input Text    ${password_input}    ${password}

Click Login Button
    Click Element    ${login_button}

Verify Successful Login
    Wait Until Element Is Visible    ${Accounts_Overview}    30s

Verify Login failed
    Wait Until Element Is Visible    ${error_message}    30s

Login With Valid Credentials
    [Arguments]    ${valid_username}    ${valid_password}
    Enter Username    ${valid_username}
    Enter Password    ${valid_password}
    Click Login Button
    Sleep    5s
    Verify Successful Login
    
Login with Empty Password or Username
    [Arguments]    ${valid_password}
    Enter Password    ${valid_password}
    Click Login Button

Login with Empty Password and Username

    Click Login Button




