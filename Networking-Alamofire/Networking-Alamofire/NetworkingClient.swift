//
//  NetworkingClient.swift
//  Networking-Alamofire
//
//  Created by Juan Capponi on 12/29/20.
//

import Foundation
import Alamofire

class NetworkingClient {
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func execute(url: URL, completion: @escaping WebServiceResponse) {
        AF.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }
}
