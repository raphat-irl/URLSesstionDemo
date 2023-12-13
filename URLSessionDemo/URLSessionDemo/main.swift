//
//  main.swift
//  URLSessionDemo
//
//  Created by Raphat Aektantidamrong on 13/12/2566 BE.
//

import Foundation

let service = HttpService(endPoint: "https://jsonplaceholder.typicode.com/todos/1")
service?.getTodo()

let text = readLine()


