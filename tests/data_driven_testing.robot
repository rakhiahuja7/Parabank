*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/common_keywords.robot
Resource    ../resources/pages/RegisterPage.robot
Library    DataDriver   file=${CURDIR}/login_data.csv  dialect=excel

Suite Setup   Load Environment
Test Setup    Open Application
Test Teardown  Close Application

Test Template  Register User

*** Test Cases ***
Test Case For Data Driven   ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${Phone}    ${SSN}    ${Username}    ${Password}    ${Confirm}
   [Documentation]      Data driven testing using csv
   [Tags]   datadriver

*** Keywords ***
Register User
    [Arguments]   ${Firstname}   ${Lastname}   ${Address}  ${City}   ${State}   ${Zipcode}  ${Phone}   ${SSN}   ${Username}  ${Password}  ${Confirm}

    Click Register Button
    Enter firstName    ${Firstname}
    Enter lastName     ${Lastname}
    Enter Address      ${Address}
    Enter City         ${City}
    Enter State        ${State}   
    Enter Zip Code     ${Zipcode}
    Enter Phone Number  ${Phone}
    Enter SSN          ${SSN}
    Enter RegUsername  ${Username}
    Enter RegPassword  ${Password}
    Enter Confirm Password  ${Confirm}
    Click Register Button Final
    Verify Successful Register