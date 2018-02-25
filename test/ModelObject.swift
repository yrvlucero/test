//
//  Rows.swift
//  test
//
//  Created by Yngwie Reigh Vincent Lucero on 23/2/18.
//

import Foundation

public struct ModelObject: Decodable {
    let title: String
    let rows: [Row]
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case rows = "rows"
    }
}
