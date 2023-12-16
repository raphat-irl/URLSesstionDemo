//
//  main.swift
//  URLSessionDemo
//
//  Created by Raphat Aektantidamrong on 13/12/2566 BE.
//

import Foundation

let service = HttpService()
service.getJSON(url: "https://jsonplaceholder.typicode.com/todos/1") { json in
    print(json)
}

print("wait for input")
let text = readLine()


