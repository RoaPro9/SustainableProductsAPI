//
//  File.swift
//  
//
//  Created by Roa Moha on 23/08/1444 AH.
//
import Fluent
import Vapor

struct CreateProduct : AsyncMigration  {
    func prepare(on database: Database) async throws {
        try await database.schema("products")
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("price", .double, .required)
            .field("packaging_id", .uuid, .required, .references("packaging", "id"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("products").delete()
    }
    
   
    
}
