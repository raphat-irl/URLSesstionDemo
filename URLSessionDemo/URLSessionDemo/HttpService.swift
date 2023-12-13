//
//  HttpService.swift
//  URLSessionDemo
//
//  Created by Raphat Aektantidamrong on 13/12/2566 BE.
//
import Foundation

class HttpService {
    
    let url: URL
    let session: URLSession
    
    init? (endPoint:String) {
        guard let url = URL(string: endPoint) else {
            print("ERROR CAN'T CREATE URL")
            return nil
        }
        self.url = url
        
        //set up session
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config)
        
    }
    
    func getTodo() {
        
        let todoRequest = URLRequest(url: url)
        
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
            print(responseData)
            print("DONE")
        }
        task.resume()
    }
    
}
