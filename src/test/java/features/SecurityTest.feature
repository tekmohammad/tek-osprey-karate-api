@Smoke
Feature: Insurance APP Security Test
#    url Step to assign BASE URL for API
    #    Path is to specify with Endpoint
    #    Request step for adding request body
    #    method step to send request for method type. post, get, put , delete
    #    status assert response status code
  Background: Setup security test
    Given url "https://dev.insurance-api.tekschool-students.com"
    And path "/api/token"

  @US1_1
  Scenario Outline: Happy Path Token Generation
    And request
    """
      {
      "username": "<username>",
      "password": "<password>"
      }
    """
    When method post
    Then status <statusCode>
    And print response

    Examples:
      | username          | password       | statusCode |
      | supervisor        | tek_supervisor | 200        |
      | operator_readonly | Tek4u2024      | 200        |


#Send request to /api/token
#With invalid username valid password
#Expected status 404
#  Response contains message user not found