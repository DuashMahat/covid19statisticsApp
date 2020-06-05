//
//  Networking.swift
//  covid19statisticsApp
//
//  Created by Duale on 6/3/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
class Networking {
    func response (url: String  , completion: @escaping (Countries) -> ()) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url, completionHandler: { (data , response , error ) in
            self.urlCompletionHandler(data: data, response: response, error: error, completion: completion)
            }).resume()
    }
    
    func urlCompletionHandler (data: Data?  , response : URLResponse? , error : Error? , completion: (Countries) -> ()) {
        guard let data = data else {return}
        do {
            let jsondecoder = JSONDecoder()
            let countries = try jsondecoder.decode(Countries.self, from: data)
            completion(countries)
        } catch {
            print("Error \(error)")
        }
    }
}
