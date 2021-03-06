# language: en
@storagegateway @client
Feature: AWS Storage Gateway

  Scenario: Making a basic request
    When I call the "ListGateways" API
    Then the response should contain a list of "Gateways"

  Scenario: Error handling
    When I attempt to call the "ListVolumes" API with:
    | GatewayARN | fake_gateway |
    Then I expect the response error code to be "ValidationException"
    And I expect the response error message to include:
    """
    invalid input
    """
