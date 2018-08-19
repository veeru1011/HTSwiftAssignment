//
//  APIManger.swift
//  HealthTapAssignment
//
//  Created by VEER BAHADUR TIWARI on 18/08/18.
//  Copyright © 2018 healthTap. All rights reserved.
//

import UIKit
import Alamofire


struct APIURL
{
    static let baseURL = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?api-key=4f2afc8240724fd695e72c73a2b1aebb"
}
class APIManger: NSObject {
    
    private static var sharedAPIClient: APIManger = {
        let apiClient = APIManger(baseURL: APIURL.baseURL)
        return apiClient
    }()
    
    let baseURL: String
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    private override init() {
        self.baseURL = ""
    }
    class func shared() -> APIManger {
        return sharedAPIClient
    }
    
    func getResultList(completionHandler:@escaping(Bool, NyTimeResult?,String) -> Void) -> Void  {
        
        Alamofire.request(self.baseURL).responseNyResult{ (response) in
            if let result = response.result.value {
                completionHandler(true, result, "success")
            } else {
                completionHandler(false, nil, "failure")
            }
        }
    }
        
}
