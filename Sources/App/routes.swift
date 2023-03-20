import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get (""){ req in 
        return "its work "
        
    }
    try app.register(collection: ProductController())
    try app.register(collection:  PackageController())
    
   
}
