//
//  CreatePackage.swift
//  
//
//  Created by Roa Moha on 23/08/1444 AH.
//

import Fluent
import Vapor
//CREATE NEW TABLE 
struct CreatePackage : AsyncMigration  {
    func prepare(on database: Database) async throws {
        try await database.schema("packaging")
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("sustainabilityRating", .double, .required)
            .create()
            
    }

    func revert(on database: Database) async throws {
        try await database.schema("packaging").delete()
    }
    
   
   
}

