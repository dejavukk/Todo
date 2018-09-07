//
//  Item.swift
//  TodoList
//
//  Created by JunHyuk on 2018. 9. 6..
//  Copyright © 2018년 junhyuk. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?  
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
    
    /*
     
     dynamic을 처음 접하고 무엇인지 궁금하여 구글링을 해보았습니다.
     
     프로퍼티가 기본 데이터베이스 데이터에 대한 접근자가 될 수 있도록, Realm모델 프로퍼티에는 @objc dynamic var 프로퍼티가 필요.
     dynamic키워드는 모델 변수에 대한 변경 사항을 Realm에 알리고, 결과적으로 이를 데이터베이스에 반영할 수 있도록 허용.
     Realm을 사용하려면, 평범한 var 프로퍼티에는 dynamic이 "필수"라고 한다.
     
     
     출처: https://zeddios.tistory.com/296 [ZeddiOS]
     
     LinkingObjects
     -> LinkingObjects
     
     */
    
    
    
}
