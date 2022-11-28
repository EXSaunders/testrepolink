*** Settings ***
Documentation   Just a test to validate login form
Library         SeleniumLibrary
Library         Collections
Test Setup      Open the browser with mortgage payment url
#Test Teardown   Close browser session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_Page_Load}           css:.nav-link

*** Test Cases ***
#Validate Unsuccessful Login
#    Fill the login form                         ${user_name}    ${invalid_password}
#    Wait until element is located in the page   ${Error_Message_Login}
#    Verify error message is correct

Validate Cards Display In Shopping Page
    Fill the login form                         ${user_name}    ${valid_password}
    Wait until element is located in the page   ${Shop_Page_Load}
    Verify card titles in the shop page
    Select the card                             Nokia Edge

*** Keywords ***
Fill the login form
    [Arguments]         ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

Verify error message is correct
    Element Text Should Be          ${Error_Message_Login}  Incorrect username/password.

Wait until element is located in the page
    [Arguments]                     ${element}
    Wait Until Element Is Visible   ${element}

Verify card titles in the shop page
    @{expectedlist} =   Create List         iphone X   Samsung Note 8  Nokia Edge  Blackberry
    ${elements} =       Get WebElements     css:.card-title
    @{actuallist} =     Create List

    FOR     ${element}  IN      @{elements}
        Append To List      ${actualList}   ${element.text}
    END
    Lists Should Be Equal   ${expectedlist}  ${actuallist}

Select the card
    [Arguments]     ${cardname}
    ${elements} =   Get WebElements     css:.card-title
    ${index} =      Set Variable        1

    FOR     ${element}  IN      @{elements}
        Exit For Loop If        '${cardname}' == '${element.text}'
        ${index}=   Evaluate    ${index} + 1
    END

    Click Button        xpath:(//*[@class='card-footer'])[${index}]/button
    Log To Console      ${index}
