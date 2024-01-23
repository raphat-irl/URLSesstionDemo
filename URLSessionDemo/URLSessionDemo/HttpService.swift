//
//  HttpService.swift
//  URLSessionDemo
//
//  Created by Raphat Aektantidamrong on 13/12/2566 BE.
//
import Foundation

enum  HttpError: Error {
    case invalidURL
    case invalidData
    case networkError
    case unknown
}
class HttpService {
    
    let session: URLSession
    
    init () {
        //set up session
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config)
    }
    
    func getJSON(url:String , completion: @escaping (String, HttpError?) -> Void ) {
        
        guard let endPoint = URL(string: url) else {
            completion("", HttpError.invalidURL)
            return
        }
        
        let request = URLRequest(url: endPoint)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            //check error
            guard error == nil else {
                completion("", HttpError.networkError)
                return
            }
            //check data
            guard let responseData = data else {
                completion("", HttpError.invalidData)
                return
            }
            
            // change response to string
            if let json:String = String(data: responseData, encoding: String.Encoding.utf8) {
                completion(json, nil)
            } else {
                completion("",HttpError.unknown)
            }
            print(responseData)
           
        }
        task.resume()
    }
}
