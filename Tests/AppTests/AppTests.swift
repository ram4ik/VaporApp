@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testHelloWorld() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "hello", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
    
    func testRestaurantsSpecialityChinese() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/restaurants/speciality/chinese", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "restaurants/speciality/chinese")
        })
    }
    
    func testRestaurantsSpecialityIndian() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/restaurants/speciality/indian", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "restaurants/speciality/indian")
        })
    }
    
    func testRestaurantsSpecialityThai() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/restaurants/speciality/thai", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "restaurants/speciality/thai")
        })
    }
    
    func testRestaurantsSpecialityEstonia() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/restaurants/speciality/estonia", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "restaurants/speciality/estonia")
        })
    }
    
    func testRestaurantsTallinnSpecialityEstonia() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "restaurants/tallinn/speciality/estonia", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "restaurants in tallinn with speciality estonia")
        })
    }

    func testRouteanyTallinnEndpoint() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/routeany/tallinn/endpoint", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "This is anything route")
        })
    }
    
    func testRouteanyAll() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/routeany/all", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "This is Catch All route")
        })
    }
    
    func testRouteanyAllOther() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/routeany/xyz/bar/foo", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "This is Catch All route")
        })
    }
    
    func testSearch() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/search?keyword=italian&page=10", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Search for Keyword italian on Page 10")
        })
    }
}
