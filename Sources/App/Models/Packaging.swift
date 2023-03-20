//
//  Packaging.swift
//  
//
//  Created by Roa Moha on 23/08/1444 AH.



import Vapor
import FluentPostgresDriver
import Fluent



// MARK: - model
final class Packaging: Content, Model  {
    static let schema = "packaging"
    
    @ID(key: .id)
    var id: UUID?
    @Field(key: "name")
    var name: String

    @Field(key: "description")
    var description: String

    @Field(key: "sustainabilityRating")
    var sustainabilityRating: Int

    
    init() { }
    
    
  
        init(id: UUID?, name: String, description: String, sustainabilityRating: Int) {
            self.id = id
            self.name = name
            self.description = description
            self.sustainabilityRating = sustainabilityRating
        }
    

}
