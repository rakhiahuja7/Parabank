*** Variables ***
${username_input}    xpath=//input[@name="username"]
${password_input}    xpath=//input[@name="password"]
${login_button}      xpath=//input[@value="Log In"]
${Accounts_Overview}      xpath=//h1[contains(text(),"Accounts Overview")]
${error_message}      xpath=//h1[contains(text(),"Error!")]
${logout_link}      xpath=//a[contains(text(),"Log Out")]