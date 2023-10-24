Feature: Authentication functionality

  @Positve @Auth
  Scenario Outline: Verify Success User login with username: <username>
    Given User on Login Pages Saucedemo
    When User fills valid <username> as username and <password> as password
    And User click on Login button
    Then User redirect to Dashboard Page

    Examples:
      | username      | password     |
      | standard_user | secret_sauce |
      | problem_user  | secret_sauce |
      | error_user    | secret_sauce |
      | visual_user   | secret_sauce |

  @Negative @Auth
  Scenario Outline: Verify Failed User Login with username: <username>
    Given User on Login Pages Saucedemo
    When User fills valid <username> as username and <password> as password
    And User click on Login button
    Then User get message <error> as error

    Examples:
      | username        | password     | error                                               |
      | locked_out_user | secret_sauce | Epic sadface: Sorry, this user has been locked out. |
      | standard_user   |              | Epic sadface: Password is required                  |
      |                 | secret_sauce | Epic sadface: Username is required                  |
      |                 |              | Epic sadface: Username is required                  |
