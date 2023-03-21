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
