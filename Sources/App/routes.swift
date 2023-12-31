import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("restaurants", "speciality", "chinese") { req async -> String in
        "restaurants/speciality/chinese"
    }
    
    app.get("restaurants", "speciality", "indian") { req async -> String in
        "restaurants/speciality/indian"
    }
    
    app.get("restaurants", "speciality", "thai") { req async -> String in
        "restaurants/speciality/thai"
    }
    
    app.get("restaurants", "speciality", ":region") { req -> String in
        guard let region = req.parameters.get("region") else {
            throw Abort(.badRequest)
        }
        return "restaurants/speciality/\(region)"
    }
    
    app.get("restaurants", ":location", "speciality", ":region") { req -> String in
        guard let locaton = req.parameters.get("location"), let region = req.parameters.get("region") else {
            throw Abort(.badRequest)
        }
        return "restaurants in \(locaton) with speciality \(region)"
    }
    
    app.get("routeany", "*", "endpoint") { req -> String in
        return "This is anything route"
    }
    
    app.get("routeany", "**") { req -> String in
        return "This is Catch All route"
    }
    
    app.get("search") { req -> String in
        guard let keyword = req.query["keyword"] as String?, let page = req.query["page"] as String? else {
            throw Abort(.badRequest)
        }
        return "Search for Keyword \(keyword) on Page \(page)"
    }
    
    let restaurants = app.grouped("restaurants")
    
    restaurants.get { req -> String in
        return "restaurants base route"
    }
    
    restaurants.get("starRating", ":stars") { req -> String in
        guard let stars = req.parameters.get("stars") else {
            throw Abort(.badRequest)
        }
        return "restaurants/starRating/\(stars)"
    }
}
