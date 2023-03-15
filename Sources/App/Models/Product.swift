
//
//  Product.swift
//
//
//  Created by Roa Moha on 23/08/1444 AH.
//

import Vapor
import Fluent
import FluentPostgresDriver

final class Product: Model, Content {
    static let schema = "products"
    
    @ID(key: .id)
    var id: UUID?
    @Field(key: "name")
    var name: String

    @Field(key: "description")
    var description: String

    @Field(key: "price")
    var price: Double

    @Parent(key: "packaging_id")
    var packaging: Packaging
    
    init() { }

    init(name: String, description: String, price: Double, packaging: Packaging) {
           self.name = name
           self.description = description
           self.price = price
           self.$packaging.id = packaging.id!
       }
    
    
    
}

