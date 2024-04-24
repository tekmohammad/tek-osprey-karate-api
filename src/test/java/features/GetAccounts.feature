Feature: Get Accounts Information


  Background: setup tests
    Given url "https://dev.insurance-api.tekschool-students.com"
  #  Activity
  #  Send request to /api/accounts/get-all-accounts
  #  Without Authentication
  #  Expected status code 401
  @Accounts_1
  Scenario: Validate request without Authorization
    And path "/api/accounts/get-all-accounts"
    When method get
    Then status 401

  # Activity
  #    Send request to /api/accounts/get-all-accounts
  #    With Authentication
  #    Expected status code 200
  @Accounts_2
  Scenario: Get all account with Authorization
    Given path "/api/token"
    And request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 200
    And print response
    * def validToken = "Bearer " + response.token
    Given path "/api/accounts/get-all-accounts"
    And header Authorization = validToken
    When method get
    Then status 200
    And print response


