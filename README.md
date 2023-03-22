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
### Heroku server
This API is deployed on the Heroku server and can be accessed through the following link:
```
  https://sustainable-products.herokuapp.com/

```
To use this API, you can make requests to the endpoints using a client such as Postman or cURL. Here is an example of how to make a request using Postman:
1. Open Postman and create a new request.
2. Set the request method (GET, POST, PUT, DELETE) and enter the URL for the desired endpoint.
3. If necessary, add request parameters or a request body.
4. Click "Send" to make the request to the API server.
5. View the response from the server in the "Body" section of the response panel.

### Clone and localhost 
To use this API, you will need to have Vapor installed. If you don't have Vapor installed, you can follow the installation guide [Here](https://docs.vapor.codes/install/macos/).

Once you have Vapor installed, you can clone the repository by running the following command in your terminal:
```
git clone https://github.com/RoaPro9/SustainableProductsAPI.git
```
Next, navigate to the cloned repository and run the following command to build and start the API server:
```
vapor run
```
This will start the API server, and you can then access the endpoints via a client such as Postman or cURL.

## Contribution

Feel free to contribute to this project by forking the repository and submitting a pull request.
