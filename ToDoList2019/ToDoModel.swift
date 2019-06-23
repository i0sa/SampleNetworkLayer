//
//  ToDoModel.swift
//  ToDoList2019
//
//  Created by Osama on 5/22/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation


struct ToDoModel: Decodable {
    var title: String
    var description: String
    var date: String
}
