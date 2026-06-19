*** Variables ***
${register_button}        xpath=//a[contains(text(),"Register")]
${first_name_input}        id=customer.firstName
${last_name_input}        id=customer.lastName
${address_input}            id=customer.address.street
${city_input}         id=customer.address.city
${state_input}        id=customer.address.state
${zip_code_input}     id=customer.address.zipCode
${phone_input}        id=customer.phoneNumber
${SSN_input}          id=customer.ssn
${regusername_input}     id=customer.username
${regpassword_input}     id=customer.password
${confirm_password_input}  id=repeatedPassword
${register_submit_button}  xpath=//input[@value="Register"]
${welcome}  xpath=//p[contains(text(),"Your account was created successfully. You are now logged in.")]