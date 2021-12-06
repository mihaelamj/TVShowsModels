//
//  Show.swift
//  TVShowsMMJ
//
//  Created by iMacPro on 18.11.2021..
//

public struct Show: Codable {
  public let id: String
  public let averageRating: Double?
  public let desc: String?
  public var imageUrl: String?
  public let noOfReviews: Int?
  public var title: String
}

// MARK: - Extensions -

extension Show: CustomStringConvertible {
  public var description: String {
    return "📽: [\(id)]: \(title)], (\(noOfReviews ?? 0))"
  }
}




