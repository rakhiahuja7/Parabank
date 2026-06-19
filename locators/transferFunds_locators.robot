*** Variables ***
${transferFunds_Button}    xpath=//a[contains(text(),"Transfer Funds")]
${amount_input}            id=amount
${from_account_dropdown}   id=fromAccountId
${to_account_dropdown}     id=toAccountId
${transfer_button}         xpath=//input[@value="Transfer"]
${transfer_confirmation}   xpath=//h1[contains(text(),"Transfer Complete!")]
${transfer_error}          xpath=//h1[contains(text(),"Error!")]