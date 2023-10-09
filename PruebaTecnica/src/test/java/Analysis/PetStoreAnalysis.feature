Feature: Test pet endpoint


  Background: Open the connection with API
    Given Call to 'petstore.swagger.io/v2'

  Scenario Outline: uploads an image
    When Fill <PetId>
    And upload <image>
    And send with method post
    Then return <code> status

    Examples:
      | PetId | image       | code |
      | 1     | myimage.jpg | 200  |
      |       | image.jpg   | 405  |
      | 1     |             | 415  |


    #valid and invalid object. In the second case, I have removed the last bracket to make it an invalid object to pass
  Scenario Outline: Add a new pet to the store
    When Fill <body>
    And send with method post
    Then return <code> status

    Examples:
      | body                                                                                                                                                 | code |
      | {"id": 0,"category": {"id": 0,"name": "string"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"} | 200  |
      | {"id": 0,"category": {"id": 0,"name": "string"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"  | 405  |


  Scenario Outline: Update an existing pet
    When Fill <id>
    And pet <found>
    And validation <exception>
    Then return <code> status

    Examples:
      | id        | found | exception | code |
      | validId   | true  | false     | 200  |
      | validId   | true  | true      | 405  |
      | invalidId | false | true      | 400  |
      | invalidId | false | false     | 400  |
      | validId   | false | true      | 200  |


  Scenario Outline: Find pets by status
    When Fill <status>
    Then return <code> status
    And <responseBody> filled

    Examples:
      | status    | code | responseBody |
      | available | 200  | true         |
      | pending   | 200  | true         |
      | sold      | 200  | true         |
      | *         | 200  | false        |
      |           | 200  | false        |


  Scenario Outline: Find pets by ID
    When Fill <petId>
    Then return <code> status

    Examples:
      | petId   | code |
      | 0       | 200  |
      | 1254632 | 404  |
      | a       | 400  |


  Scenario Outline: Updates a pet in the store with form data
    When Fill <petId>
    And Fill <name>
    And Fill <status>
    Then return <code> status

    Examples:
      | petId        | name      | status      | code |
      | 5            | validName | validStatus | 200  |
      | invalidPetId | validName | validStatus | 405  |


  Scenario Outline: Deletes a pet
    When Fill <petId>
    Then return <code> status

    Examples:
      | petId            | code |
      | 5                | 200  |
      | invalidPetId     | 400  |
      | nonExistingPetId | 404  |