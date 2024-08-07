//
//  ImageDataModel.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import Foundation

// MARK: - ImageFetchResult

class ImageFetchResult: Decodable {
  var items: [Item]
}


// MARK: - Media

struct Media: Decodable {
  let m: String
}

// MARK: - Item

struct Item: Decodable, Identifiable {
  let id = UUID()
  let author: String
  let dateTaken: String
  let description: String
  let link: String
  let media: Media
  let published: String
  let title: String

  var urlStr: String {
    media.m
  }
  
  var altText: String {
    /// alt in desciption and title seem to always match, but
    /// it's better to look for the intended alt text before assuming
    /// they match
    getValue(for: .altText) ?? title
  }
  
  var height: Double {
    let defaultValue = 200.0
    if let height = getValue(for: .height) {
      return Double(height) ?? defaultValue
    } else {
      return defaultValue
    }
  }
  
  var width: Double {
    let defaultValue = 200.0
    if let height = getValue(for: .width) {
      return Double(height) ?? defaultValue
    } else {
      return defaultValue
    }
  }
  
  enum CodingKeys: String, CodingKey {
    case author
    case dateTaken = "date_taken"
    case description
    case link
    case media
    case title
    case published
   
  }
  
  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.author = try container.decode(String.self, forKey: .author)
    self.dateTaken = try container.decode(String.self, forKey: .dateTaken)
    self.description = try container.decode(String.self, forKey: .description)
    self.link = try container.decode(String.self, forKey: .link)
    self.media = try container.decode(Media.self, forKey: .media)
    self.title = try container.decode(String.self, forKey: .title)
    self.published = try container.decode(String.self, forKey: .published)
  }
  
  /// Regex filters for description html content
  enum DescriptionFilter: String {
    case altText = "(alt=\").*\""
    case height = "(height=\")[0-9]*"
    case width = "(width=\")[0-9]*"
    
    /// hacky way to drop html prefixes
    var dropPrefixCount: Int {
      switch self {
      case .altText: return "alt=\"".count
      case .height: return "height=\"".count
      case .width: return "width=\"".count
      }
    }
  }
  
  /// Applies filter to html content and attempts to return the requested
  /// content without it's html wrapper
  /// - Parameter descFilter: `DescriptionFilter` which provides regex for filtering
  /// - Returns: an optional `String` of the requested html object without the html wrapper
  /// - Note: Unit tests are available for this function
  private func getValue(for descFilter: DescriptionFilter) -> String? {
    guard let reg = try? Regex(descFilter.rawValue) else { fatalError() }
    
    /// pattern to find  in description html
    let ranges = description.ranges(of: reg)
    
    /// grab first matching range
    guard let altTextRange = ranges.first
    else { return nil }
    
    /// set range within description
    let startIndex = altTextRange.lowerBound
    let endIndex = altTextRange.upperBound
    let range: Range = startIndex..<endIndex
    
    /// capture alt String and remove "alt=" prefix
    var altText = description[range].dropFirst(descFilter.dropPrefixCount)
    if altText.last == "\"" { altText = altText.dropLast() }
    return "\(altText)"
  }
  
}
