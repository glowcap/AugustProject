//
//  AugustProjectTests.swift
//  AugustProjectTests
//
//  Created by Daymein Gregorio on 8/6/24.
//

import XCTest
@testable import AugustProject

final class AugustProjectTests: XCTestCase {
  
  func testImageFetchResultDecoding() {
    guard let data = loadJson(from: "flickrResponse")
    else { return XCTFail("could not parse json file") }
    XCTAssert(true)
    let decoder = JSONDecoder()
    do {
      let result = try decoder.decode(ImageFetchResult.self, from: data)
      XCTAssert(!result.items.isEmpty)
    } catch {
      XCTFail("Failed to parse ImageFetchResult")
    }
  }
  
  func testImageFetchResultRegexFilter_altText() {
    let altText = "ALT-TEXT"
    guard let data = loadJson(from: "flickrResponse")
    else { return XCTFail("could not parse json file") }
    XCTAssert(true)
    let decoder = JSONDecoder()
    do {
      let result = try decoder.decode(ImageFetchResult.self, from: data)
      XCTAssertEqual(result.items.first!.altText, altText)
    } catch {
      XCTFail("Failed to parse ImageFetchResult")
    }
  }
  
  func testImageFetchResultRegexFilter_height() {
    let height: Double = 400
    guard let data = loadJson(from: "flickrResponse")
    else { return XCTFail("could not parse json file") }
    XCTAssert(true)
    let decoder = JSONDecoder()
    do {
      let result = try decoder.decode(ImageFetchResult.self, from: data)
      XCTAssertEqual(result.items.first!.height, height)
    } catch {
      XCTFail("Failed to parse ImageFetchResult")
    }
  }

  
  /// Loads JSON Data from a JSON file
  /// - Parameter fileName: file name of JSON file. Do not include extension
  /// - Returns: Optional JSON data to be parsed with `JSONDecoder`
  /// - Note: If it fails here, double check your file name. If that doesn't work, validate the JSON in the file.
  /// Beyond that, you may want to check the file's target membership.
  private func loadJson(from fileName: String) -> Data? {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")
    else { return nil }
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
  
}
