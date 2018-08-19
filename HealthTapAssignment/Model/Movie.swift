//
//  Movie.swift
//  HealthTapAssignment
//
//  Created by VEER BAHADUR TIWARI on 18/08/18.
//  Copyright © 2018 healthTap. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let displayTitle: String?
    let mpaaRating: String?
    let criticsPick: Int?
    let byline: String?
    let headline: String?
    let summaryShort: String?
    let publicationDate: String?
    let dateUpdated: String?
    let link: Link?
    let multimedia: Multimedia?
    
    
    enum CodingKeys: String, CodingKey {
        case displayTitle = "display_title"
        case mpaaRating = "mpaa_rating"
        case criticsPick = "critics_pick"
        case byline = "byline"
        case headline = "headline"
        case summaryShort = "summary_short"
        case publicationDate = "publication_date"
        case dateUpdated = "date_updated"
        case link = "link"
        case multimedia = "multimedia"
    }
}

struct Link: Codable {
    let type: String?
    let url: String?
    let suggestedLinkText: String?
    
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case url = "url"
        case suggestedLinkText = "suggested_link_text"
    }
}

struct Multimedia: Codable {
    let type: String?
    let source: String?
    let width: Int?
    let height: Int?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case source = "src"
        case width = "width"
        case height = "height"
    }
}
