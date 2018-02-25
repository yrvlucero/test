//
//  Row.swift
//  test
//
//  Created by Yngwie Reigh Vincent Lucero on 23/2/18.
//

import Foundation

public struct Row: Decodable {
    let title: String?
    let description: String?
    let imageHref: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
    }
}
