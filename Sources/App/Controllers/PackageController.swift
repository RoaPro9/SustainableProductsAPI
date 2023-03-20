//
//  File.swift
//  
//
//  Created by raghad khalid alsaif on 28/08/1444 AH.
//


import Fluent
import Vapor

struct PackageController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let Packaging = routes.grouped("Packaging")
        
        //get the info from db
        Packaging.get( use: index)
        
        //create a new product
        Packaging.post( use: create)
        Packaging.delete(":id", use: delete)
        Packaging.get(":id", use: getById)
        Packaging.put( use: update)

        
    }
    // ------- get -------/ event route
    func index(req: Request) async throws -> [Packaging]{
        try await Packaging.query(on: req.db).all()
    }
    
    func getById(req: Request) async throws -> Packaging{
        guard let Package = try await Packaging.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return Package
    }
    
    func create(req: Request) async throws -> Packaging{
        let Package = try req.content.decode(Packaging.self)
        try await Package.save(on: req.db)
        return Package
    }
    func delete(req: Request) async throws -> HTTPStatus{
        guard let package = try await Packaging.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await package.delete(on: req.db)
        return .noContent
    }

    
    func update (req: Request) async throws -> HTTPStatus{
        let package = try req.content.decode(Packaging.self)
        guard let Package = try await Packaging.find(package.id , on : req.db) else {
            throw Abort(.notFound)
        }
        Package.name = package.name
        Package.description = package.description
        Package.sustainabilityRating = package.sustainabilityRating
        
        try await Package.update(on : req.db)
        return .ok
    }
    
    
    
}


