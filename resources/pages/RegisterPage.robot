*** Settings ***
Library    SeleniumLibrary

Resource    ../../locators/register_locators.robot


*** Keywords ***

Click Register Button
    Wait Until Element Is Visible    ${register_button}    20s
    Click Element    ${register_button}

Enter firstName
    [Arguments]    ${firstName}
    Input Text    ${first_name_input}    ${firstName}

Enter lastName
    [Arguments]    ${lastName}
    Input Text    ${last_name_input}    ${lastName}

Enter Address
    [Arguments]    ${address}
    Input Text    ${address_input}    ${address}

Enter City
    [Arguments]    ${city}
    Input Text    ${city_input}    ${city}

Enter State
    [Arguments]    ${state}
    Input Text    ${state_input}    ${state}

Enter Zip Code
    [Arguments]    ${zip}
    Input Text    ${zip_code_input}    ${zip}

Enter Phone Number
    [Arguments]    ${phone}
    Input Text    ${phone_input}    ${phone}

Enter SSN
    [Arguments]    ${ssn}
    Input Text    ${SSN_input}    ${ssn}

Enter RegUsername
    [Arguments]    ${username}
    Input Text    ${regusername_input}    ${username}

Enter RegPassword
    [Arguments]    ${password}
    Input Text    ${regpassword_input}    ${password}

Enter Confirm Password
    [Arguments]    ${confirm_password}
    Input Text    ${confirm_password_input}    ${confirm_password}

Click Register Button Final
    Click Element    ${register_submit_button}

Verify Successful Register
    Wait Until Element Is Visible    ${welcome}    30s

Register a new user
    Click Register Button
    Sleep    5s

    Enter firstName    abc
    Enter lastName     def
    Enter Address      123,main street
    Enter City         New York
    Enter State        NY
    Enter Zip Code     10001
    Enter Phone Number  1234567890
    Enter SSN          123
    Enter RegUsername     hiabc
    Enter RegPassword     1234
    Enter Confirm Password  1234

    Click Register Button Final
    Sleep    5s

    Verify Successful Register


