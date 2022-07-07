# MobileTestMarvel
This is a simple skeleton application using the Marvel API which gives a list of characters and you can access to each to get more information about the character.

For the architecture of the solution, a Data/Domain/App architecture was used. Thanks to this, the logic was separated from the visual part of the application and allowing a modular scalability. For the Api conection URLSession was used togheter with UIKit for the visual part of the aplication. Some test were also implemented using XCTest, the tests were focused on obtaining the information from the Api.
