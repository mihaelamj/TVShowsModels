import XCTest
@testable import TVShowsModels

final class TVShowsModelsTests: XCTestCase {
  
  // MARK: Properties -
  
  let decoder = { () -> JSONDecoder in
    let result = JSONDecoder()
    result.keyDecodingStrategy = .convertFromSnakeCase
    return result
  }()
  
  // MARK: Model Tests -

  func testDecodeErrors() throws {
    let jsonString =
    """
      {
        "errors": [
          "You need to sign in or sign up before continuing."
        ]
      }
    """
    let data = jsonString.data(using: .utf8)
    XCTAssertNotNil(data)
    
    let item = try decoder.decode(Errors.self, from: data!)
    XCTAssertTrue(item.items?.count == 1)
  }
  
  func testDecodeUser() throws {
    let jsonString =
    """
      {
         "id": "32",
         "email": "new@mail.com",
         "image_url": null
       }
    """
    let data = jsonString.data(using: .utf8)
    XCTAssertNotNil(data)
    
    let item = try decoder.decode(User.self, from: data!)
    XCTAssertEqual(item.email, "new@mail.com")
  }
  
  func testDecodeShow() throws {
    let jsonString =
    """
      {
        "id": "22",
        "average_rating": null,
        "description": null,
        "image_url": "memory://7772c3cfa8e57aa37e70fc6b4158a9fe",
        "no_of_reviews": 0,
        "title": "Tv Show 22"
      }
    """
    let data = jsonString.data(using: .utf8)
    XCTAssertNotNil(data)
    
    let item = try decoder.decode(Show.self, from: data!)
    XCTAssertEqual(item.title, "Tv Show 22")
  }
  
  func testDecodeReview() throws {
    let jsonString =
    """
      {
        "id": "1",
        "comment": "This is a nice comment",
        "rating": 1,
        "show_id": 1,
        "user": {
          "id": "2",
          "email": "john1@example.com",
          "image_url": null
        }
      }
    """
    let data = jsonString.data(using: .utf8)
    XCTAssertNotNil(data)
    
    let item = try decoder.decode(Review.self, from: data!)
    XCTAssertEqual(item.comment, "This is a nice comment")
    XCTAssertEqual(item.user.email, "john1@example.com")
  }
  
}
