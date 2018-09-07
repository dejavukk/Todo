//
//  Category.swift
//  TodoList
//
//  Created by JunHyuk on 2018. 9. 6..
//  Copyright © 2018년 junhyuk. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {

    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
