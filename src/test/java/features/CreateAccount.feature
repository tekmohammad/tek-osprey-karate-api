@Regression
Feature: Create new Account

  #Send request to /api/accounts/add-primary-account
  #Response status should be 201
  #Assert email address.

  @CreateAccount
  Scenario: Create Account happy path
    Given url BASE_URL
    And path "/api/accounts/add-primary-account"
    And request
      """
      {
        "email": "mohammad.instructor5879@tekschool.us",
        "firstName": "Mohammad",
        "lastName": "Shokriyan",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Software developer",
        "dateOfBirth": "1985-02-16"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == "mohammad.instructor5879@tekschool.us"
    * def accountId = response.id
    * def result = callonce read('GenerateValidToken.feature')
    * def token = "Bearer " + result.response.token
    Given path "/api/accounts/delete-account"
    And header Authorization = token
    And param primaryPersonId = accountId
    When method delete
    Then status 200