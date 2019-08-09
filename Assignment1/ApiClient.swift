//
//  ApiClient.swift
//  Assignment1
//
//  Created by admin on 09/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient {
    let baseUrl =  "https://hn.algolia.com/api/v1/"
    
    func getPost(page:Int=1, completionHandler:@escaping ([Post])->Void, errorHandler:@escaping ()->Void){
        let completePath = baseUrl + "search_by_date?tags=story&page=\(page)"
        guard let url = URL(string: completePath) else {
            return
        }
        Alamofire.request(url,method: .get).response { (response) in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let hits = try decoder.decode(Hits.self, from: data)
                if hits.hits.count>0{
                    completionHandler(hits.hits)
                }else{
                    errorHandler()
                }
            } catch let error {
                print(error)
                errorHandler()
            }
        }
        
    }
}
