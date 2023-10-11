@iTunesSearchAPI
Feature: Searching for Jack Johnson on iTunes

  Scenario: Searching for Jack Johnson's content
    Given the base URL is "https://itunes.apple.com"
    When a GET request is made to "/search" with the following parameters:
      | search_term | jack+johnson |
    Then the response status code should be 200
    And the response should contain the text "Jack Johnson"

  Scenario: Searching for Jack Johnson's music videos
    Given the base URL is "https://itunes.apple.com"
    When a GET request is made to "/search" with the following parameters:
      | search_term | jack+johnson |
      | entity      | musicVideo   |
    Then the response status code should be 200
    And the response should contain the text "Jack Johnson"
    And the response should contain the text "music-video"

  Scenario: Looking up Jack Johnson by iTunes artist ID
    Given the base URL is "https://itunes.apple.com"
    When a GET request is made to "/lookup" with the following parameters:
      | artist_id | 909253 |
    Then the response status code should be 200
    And the response should contain the text "Jack Johnson"
  
  
  #Same Example with Scenario outline which is useful when we run paralell   
  Scenario Outline: Searching for <ArtistName>'s content
    Given the base URL is "https://itunes.apple.com"
    When a GET request is made to "/search" with the following parameters:
      | search_term | <SearchTerm> |
    Then the response status code should be 200
    And the response should contain the text "<ExpectedText>"

    Examples:
      | ArtistName  | SearchTerm    | ExpectedText  |
      | Jack Johnson| jack+johnson  | Jack Johnson  |
      | Some Artist | some+artist   | Some Artist   |
      | Another One | another+one   | Another One   |