Feature: Insurance APP Security Test

  Scenario: Happy Path Token Generation
#    url Step to assign BASE URL for API
    Given url "https://dev.insurance-api.tekschool-students.com"
#    Path is to specify with Endpoint
    And path "/api/token"
#    Request step for adding request body
    And request {"username": "supervisor","password": "tek_supervisor"}
#    method step to send request for method type. post, get, put , delete
    When method post
#    status assert response status code
    Then status 200