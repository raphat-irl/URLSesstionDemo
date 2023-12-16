//
//  HttpService.swift
//  URLSessionDemo
//
//  Created by Raphat Aektantidamrong on 13/12/2566 BE.
//
import Foundation

class HttpService {
    
    let session: URLSession
    
    init () {
        //set up session
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config)
    }
    
    func getJSON(url:String , completion: @escaping (String) -> Void ) {
        
        guard let endPoint = URL(string: url) else {
            print("ERROR CAN'T CREATE URL")
            return
        }
        
        let todoRequest = URLRequest(url: endPoint)
        
        let task = session.dataTask(with: todoRequest) { (data, response, error) in
            //check error
            guard error == nil else {
                print("ERROR Calling getTodo")
                return
            }
            //check data
            guard let responseData = data else {
                print("ERROR NO DATA")
                return
            }
            
            // change response to string
            if let json:String = String(data: responseData, encoding: String.Encoding.utf8) {
                completion(json)
            }
            completion("")
            
            print(responseData)
            print("DONE")
           
        }
        task.resume()
    }
}
