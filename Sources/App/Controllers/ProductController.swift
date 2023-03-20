//
//  File.swift
//  
//
//  Created by raghad khalid alsaif on 28/08/1444 AH.
//


import Fluent
import Vapor

struct ProductController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let Product = routes.grouped("Product")
        
        //get the info from db
        Product.get( use: index)
        
        //create a new product
        Product.post( use: create)
    }
    // ------- get -------/ event route
    func index(req: Request) async throws -> [Product]{
        try await Product.query(on: req.db).all()
    }
    
    func getById(req: Request) async throws -> Product{
        guard let product = try await Product.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return product
    }
    
    func create(req: Request) async throws -> Product{
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
        return product
    }
    
    func delete(req: Request) async throws -> HTTPStatus{
        guard  let product = try await Product.find(req.parameters.get("productID"), on: req.db) else{
            throw Abort(.notFound)
        }
        try await product.delete(on: req.db)
        return .noContent
        
    }
    func update (req: Request) async throws -> HTTPStatus{
        let product = try req.content.decode(Product.self)
        guard let product = try await Product.find(product.id , on : req.db) else {
            throw Abort(.notFound)
        }
        product.name = product.name
        try await product.save(on : req.db)
        return .ok
    }
    
    
    
    
}

