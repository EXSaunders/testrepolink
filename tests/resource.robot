*** Settings ***
Documentation   Resource file of reusuable
...             Keywords and variable
Library         SeleniumLibrary
Library         OperatingSystem

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     123456789
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser with mortgage payment url
    Create Webdriver    Chrome  executable_path=c:/webDrivers/chromedriver
    Go To               ${url}

Close browser session
    Close Browser