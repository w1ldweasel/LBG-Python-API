Feature: Testing the REST application

    Scenario Outline: User adding a new item successfully
        Given That a user is on the url "http://localhost:8080/index.html"
        When The user enters the item name "<name>", description "<description>", and price "<price>" into the CREATE section
        And The user clicks the POST button
        Then The READ ALL section will populate with JSON containing _id "<_id>", name "<name>", description "<description>", and price "<price>"
        Examples:
            | name |  description | price | _id |
            | Test Name | Test Description | 9.99 | 1 |

    Scenario Outline: User reading one item successfully
        Given That a user is on the url "http://localhost:8080/index.html"
        When The user enters the item _id "<_id>" into the GET ONE section
        And The user clicks the GET One button
        Then The READ ONE section will populate with JSON containing _id "<_id>", name "<name>", description "<description>", and price "<price>"
        Examples:
            | name |  description | price | _id |
            | Test Name | Test Description | 9.99 | 1 |

    Scenario Outline: User updating one item successfully
        Given That a user is on the url "http://localhost:8080/index.html"
        When The user enters the item _id "<_id>", name "<name>", description "<description>", and price "<price>" into the UPDATE section
        And The user clicks the PUT button
        And The user enters the item _id "<_id>" into the GET ONE section
        And The user clicks the GET One button
        Then The READ ONE section will populate with JSON containing _id "<_id>", name "<name>", description "<description>", and price "<price>"
        Examples:
            | name |  description | price | _id |
            | Updated Name | Updated Description | 99.99 | 1 |

    Scenario Outline: User deleting one item successfully
        Given That a user is on the url "http://localhost:8080/index.html"
        When The user enters the item _id "<_id>" into the DELETE section
        And The user clicks the DELETE button
        And The user enters the item _id "<_id>" into the GET ONE section
        And The user clicks the GET One button
        Then The READ ONE section will be empty
        Examples:
            | _id |
            | 1 |
