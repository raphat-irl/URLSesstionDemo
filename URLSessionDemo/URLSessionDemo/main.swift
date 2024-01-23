//
//  main.swift
//  URLSessionDemo
//
//  Created by Raphat Aektantidamrong on 13/12/2566 BE.
//

import Foundation

let httpClient = HttpService()

httpClient.getJSON(url: "https://jsonplaceholder.typicode.com/todos/1") { (result, error) in
    
    guard error == nil else {
        print(error!)
        return
    }
    print(result)
}

let _ = readLine()


