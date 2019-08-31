//
//  NetworkClient.swift
//  ToDoList2019
//
//  Created by Osama on 6/22/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkClient {
    
    typealias onSuccess<T> = ((T) -> ())
    typealias onFailure = ( (_ error: Error) -> ())
   
    // object parameter is added here so the T generic param can infer the type
    // All objects must conform to "Decodable" protocol
    static func performRequest<T>(_ object: T.Type, router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T: Decodable{
            Alamofire.request(router).responseJSON { (response) in
                do {
                    let Lists = try JSONDecoder().decode(T.self, from: response.data!)
                
                    success(Lists)
                } catch let error{
                    failure(error)
                }
        }
    }
}
