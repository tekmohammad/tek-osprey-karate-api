@Regression
Feature:  Create Account End 2 End Feature



  #1) Using /api/accounts/add-primary-account
  #Create an Account.
  #Then using /api/accounts/add-account-car
  #Add a car to Created Account
  #Then using /api/accounts/add-account-phone
  #Add a phone to Created Account.
  Background: Setup Test
    Given url "https://dev.insurance-api.tekschool-students.com"

    @End2EndCreateAccount
  Scenario: Create Account add phone and Car to Created Account
    * def createAccountResult = callonce read('CreateAccountWithJava.feature')
    * def createdAccountId = createAccountResult.response.id
    * def generateTokenResult = callonce read('GenerateValidToken.feature')
    * def validToken = "Bearer " + generateTokenResult.response.token
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = createdAccountId
    And header Authorization = validToken
    And request
      """
      {
        "make": "Ford",
        "model": "Mustang",
        "year": "2018",
        "licensePlate": "UCS-9876"
      }
      """
    When method post
    Then status 201
    And assert response.make == "Ford"
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = createdAccountId
    And header Authorization = validToken
    And request
      """
      {
        "phoneNumber": "2023535625",
        "phoneExtension": "",
        "phoneTime": "AnyTime",
        "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And assert response.phoneNumber == "2023535625"