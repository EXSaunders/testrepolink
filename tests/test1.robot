*** Settings ***
Documentation   Just a test to validate login form
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate Successful Login
    open the browser with mortgage payment url
    fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with mortgage payment url
    Create Webdriver    Chrome  executable_path=c:/webDrivers/chromedriver
    Go To               https://rahulshettyacademy.com/loginpagePractise/


fill the login form
    Input Text          id:username     rahulshettyacademy
    Input Password      id:password     123456789
    Click Button        signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Message_Login}

verify error message is correct
    Element Text Should Be          ${Error_Message_Login}  Incorrect username/password.
