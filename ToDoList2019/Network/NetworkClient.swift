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
    
    
    static func addToDoList(title: String, desc: String, onSuccess: @escaping onSuccess<[ToDoModel]>,
                            onFailure: @escaping onFailure){
        performRequest(router: APIRouter.addToDo(title: title, description: desc), success: { (models) in
            onSuccess(models)
        }) { (error) in
            onFailure(error)
        }
    }
    
    static func getToDoLists(success: @escaping onSuccess<[ToDoModel]>,
                             failure: @escaping onFailure){
        
        performRequest(router: APIRouter.getTodoLists, success: { (models) in
            success(models)
        }) { (error) in
            failure(error)
        }
    }
        
    static func performRequest<T>(router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T: Decodable{
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
