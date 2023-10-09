Feature: Create new user's account

  Background: Open the Firefox and launch the application
    Given Open the Firefox and launch the application

# Scenarios for testing values using Partition Equivalency,  for each field. And testing each field isolated
  Scenario Outline: Create a new users account

    When Fill FirstName with value <firstName>
    And Fill LastName with value <lastName>
    And Fill Date of Birth with value <date>
    And Fill Email with value <email>
    And Fill RepeatEmail with value <repeatEmail>
    And Fill Password with value <pass>
    And Check Terms and Condiciones <valueCheck>
    And Click on Register button
    Then The user is <redirected>

    Examples:
      | firstName                                       | lastName | date       | email                                   | repeatEmail                             | pass                               | valueCheck | redirected |
      | as                                              | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | false      |
      | asasas                                          | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | true       |
      | a name composed by more than 150 characters     | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | false      |
      | maria                                           | pa       | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | false      |
      | maria                                           | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | true       |
      | a lastname composed by more than 150 characters | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | false      |
      | maria                                           | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | true       |
      | maria                                           | parra    | 01/15/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | false      |
      | maria                                           | parra    | 01/01/1900 | emailWithMoreThan150Characters@asdf.com | myemail@asdf.com                        | mypassword                         | true       | false      |
      | maria                                           | parra    | 01/01/1900 | myemail@asdf.com                        | emailWithMoreThan150Characters@asdf.com | mypassword                         | true       | false      |
      | maria                                           | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypa                               | true       | false      |
      | maria                                           | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | true       | true       |
      | maria                                           | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypasswordWithMoreThan20Characters | true       | false      |
      | maria                                           | parra    | 01/01/1900 | myemail@asdf.com                        | myemail@asdf.com                        | mypassword                         | false      | false      |

    # Scenario for acceptance criteria num 1
  Scenario Outline: Email registered
    Given There is an account registered with an specific <email>
    When Fill FirstName with value <firstName>
    And Fill LastName with value <lastName>
    And Fill Date of Birth with value <date>
    And Fill Email with value <email>
    And Fill RepeatEmail with value <repeatEmail>
    And Fill Password with value <pass>
    And Check Terms and Condiciones <valueCheck>
    And Click on Register button
    Then The user is <redirected>
    And The <message> is displayed

    Examples:
      | firstName | lastName | date       | email            | repeatEmail      | pass       | valueCheck | redirected | message                                                          |
      | maria     | pa       | 01/01/1900 | myemail@asdf.com | myemail@asdf.com | mypassword | true       | true       | "There is an existing account associated with <<EMAIL_ADDRESS>>" |


    #Scenario for acceptance criteria num 2
  Scenario Outline: Email invalid

    When Fill FirstName with value <firstName>
    And Fill LastName with value <lastName>
    And Fill Date of Birth with value <date>
    And Fill Email with value <email>
    And Fill RepeatEmail with value <repeatEmail>
    And Fill Password with value <pass>
    And Check Terms and Condiciones <valueCheck>
    And Click on Register button
    Then The user is <redirected>
    And The <message> is displayed
    Examples:
      | firstName | lastName | date       | email       | repeatEmail | pass       | valueCheck | redirected | message          |
      | maria     | parra    | 01/01/1900 | invalidMail | invalidMail | mypassword | true       | false      | "Invalid email." |


    #Scenario for acceptance criteria num 3
  Scenario Outline: empty fields

    When Fill FirstName with value <firstName>
    And Fill LastName with value <lastName>
    And Fill Date of Birth with value <date>
    And Fill Email with value <email>
    And Fill RepeatEmail with value <repeatEmail>
    And Fill Password with value <pass>
    And Check Terms and Condiciones <valueCheck>
    And Click on Register button
    Then The user is <redirected>
    And The <message> is displayed
    Examples:
      | firstName | lastName | date       | email            | repeatEmail      | pass       | valueCheck | redirected | message                                        |
      |           | parra    | 01/01/1900 | myemail@asdf.com | myemail@asdf.com | mypassword | true       | false      | "Please fill in this <<FirstName>>"            |
      | maria     |          | 01/01/1900 | myemail@asdf.com | myemail@asdf.com | mypassword | true       | false      | "Please fill in this <<LastName>>"             |
      | maria     | parra    |            | myemail@asdf.com | myemail@asdf.com | mypassword | true       | false      | "Please fill in this <<Date>>"                 |
      | maria     | parra    | 01/01/1900 |                  | myemail@asdf.com | mypassword | true       | false      | "Please fill in this <<Email>>"                |
      | maria     | parra    | 01/01/1900 | myemail@asdf.com |                  | mypassword | true       | false      | "Please fill in this <<RepeatEmail>>"          |
      | maria     | parra    | 01/01/1900 | myemail@asdf.com | myemail@asdf.com |            | true       | false      | "Please fill in this <<Password>>"             |
      | maria     | parra    | 01/01/1900 | myemail@asdf.com | myemail@asdf.com | mypassword | false      | false      | "Please fill in this <<Terms And conditions>>" |



    #Scenario for acceptance criteria num 4
  Scenario Outline: Future date

    When Fill FirstName with value <firstName>
    And Fill LastName with value <lastName>
    And Fill Date of Birth with value <date>
    And Fill Email with value <email>
    And Fill RepeatEmail with value <repeatEmail>
    And Fill Password with value <pass>
    And Check Terms and Condiciones <valueCheck>
    And Click on Register button
    Then The user is <redirected>
    And The <message> is displayed
    Examples:
      | firstName | lastName | date       | email            | repeatEmail      | pass       | valueCheck | redirected | message                                  |
      | maria     | parra    | 01/01/2300 | myemail@asdf.com | myemail@asdf.com | mypassword | true       | false      | "Selected date exceeds the current date" |



    #Scenario for acceptance criteria num 5
  Scenario Outline: Registration and redirection

    When Fill FirstName with value <firstName>
    And Fill LastName with value <lastName>
    And Fill Date of Birth with value <date>
    And Fill Email with value <email>
    And Fill RepeatEmail with value <repeatEmail>
    And Fill Password with value <pass>
    And Check Terms and Condiciones <valueCheck>
    And Click on Register button
    Then The user is <redirected>
    And The <message> is displayed
    And The user receives an email with a link
    Examples:
      | firstName | lastName | date       | email            | repeatEmail      | pass       | valueCheck | redirected | message                                                                      |
      | maria     | parra    | 01/01/1900 | myemail@asdf.com | myemail@asdf.com | mypassword | true       | false      | "Validate your email. A confirmation email has been sent to you. Please...." |


    #Scenario for acceptance criteria num 6
  Scenario: Activate account in the same browser
    Given The user has received an email with a link and is opened is the same browser
    When The user activates the account
    Then The user is automatically logged in the system

        #Scenario for acceptance criteria num 7
  Scenario: Activate account in a different browser
    Given The user has received an email with a link and is opened on a different browser
    When The user activates the account
    Then The user is redirected to login page
    And A Welcome message is displayed
    And The email field is pre-populated