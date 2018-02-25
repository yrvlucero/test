//
//  Api.swift
//  OneID
//
//  Created by Yngwie Reigh Vincent Lucero on 16/1/18.
//  Copyright © 2018 Unicard. All rights reserved.
//

import Foundation
import Alamofire

public struct Api{
    
    func getData() -> Callback<ModelObject>{
        let callback = Callback<ModelObject>()
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else { return callback}
        Alamofire.request(url).responseData { (response) in
            if let error = response.result.error {
                callback.failure(error: error)
            }
            if let d = response.result.value{
                if let value = String(data: d, encoding: String.Encoding.ascii) {
                    
                    if let jsonData = value.data(using: String.Encoding.utf8) {
                        do {
                            let obj = try JSONDecoder().decode(ModelObject.self, from: jsonData)
                            callback.success(result: obj)
                        } catch {
                            callback.failure(error: error)
                            NSLog("ERROR \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
        return callback
    }
}

