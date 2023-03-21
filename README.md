# SustainableProducts Vapor API
This is a Vapor API for managing sustainable products and packaging. The API supports the four main CRUD functions (Create, Read, Update, and Delete) for both products and packaging.

## Endpoints
### Product Endpoints
* Get all products
Returns a list of all products.

```
  GET /Product
```
* Get a specific product

```
  GET /Product/{id}
```
* Create a new product

```
  POST /Product
```
* Update a product

```
  PUT /Product/{id}
```
* Deletes a specific product by ID

```
DELETE /Product/{id}
```

### Packaging Endpoints
* Get all packaging
Returns a list of all packaging options.

```
 GET /Packaging
```
* Get a specific packaging

```
  GET /Packaging/{id}
```
* Create a new packaging

```
  POST /Packaging
```
* Update a packaging

```
  PUT /Packaging/{id}
```
* Deletes a specific packaging by ID

```
DELETE /Packaging/{id}
```
## Models
The API has two models: Product and Packaging.

### Product Model

```swift
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


```
### Packaging Model

```swift
final class Packaging: Content, Model  {
    static let schema = "packaging"
    
    @ID(key: .id)
    var id: UUID?
    @Field(key: "name")
    var name: String

    @Field(key: "description")
    var description: String

    @Field(key: "sustainabilityRating")
    var sustainabilityRating: Double

    @Children(for: \.$packaging)
    var pacginng: [Product]
    
    init() { }
    
    
  
        init(id: UUID?, name: String, description: String, sustainabilityRating: Double) {
            self.id = id
            self.name = name
            self.description = description
            self.sustainabilityRating = sustainabilityRating
        }
    

}

```
## Usage
