//
//  Result.swift
//  HealthTapAssignment
//
//  Created by VEER BAHADUR TIWARI on 18/08/18.
//  Copyright © 2018 healthTap. All rights reserved.
//

import Foundation


struct NyTimeResult: Codable {
    let status: String?
    let copyright: String?
    let hasMore: Bool?
    let numResults: Int?
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case hasMore = "has_more"
        case numResults = "num_results"
        case movies = "results"
    }
}
