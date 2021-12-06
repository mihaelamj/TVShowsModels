//
//  File.swift
//  
//
//  Created by iMacPro on 30.11.2021..
//

import Foundation

public struct Errors: Decodable {
  public let items: [String]?
  
  private enum CodingKeys: String, CodingKey {
    case errors
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    items = try values.decodeIfPresent([String].self, forKey: .errors)
  }
}

