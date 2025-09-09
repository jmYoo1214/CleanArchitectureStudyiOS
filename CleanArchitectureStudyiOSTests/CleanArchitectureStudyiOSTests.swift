//
//  CleanArchitectureStudyiOSTests.swift
//  CleanArchitectureStudyiOSTests
//
//  Created by eric.yu on 9/9/25.
//

import XCTest
@testable import CleanArchitectureStudyiOS

final class CleanArchitectureStudyiOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_FetchTodos_returnsSeededList() {
        let seed = [Todo(id: UUID(), title: "A"), Todo(id: UUID(), title: "B")]
        let repo = FakeTodoRepository(list: seed)
        let sut = FetchTodosUseCaseImpl(repo: repo)
        
        let result = sut.execute()
        
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result.map(\.title), ["A","B"])
    }
    
    func test_AddTodo_appendAndRetrunsNewTodo() {
        let repo = FakeTodoRepository(list: [])
        let sut = AddTodoUseCaseImpl(repo: repo)
        
        let added = sut.executed(title: "New")
        
        XCTAssertEqual(added.title, "New")
        XCTAssertEqual(repo.fetchTodos().count, 1)
    }

}

final class FakeTodoRepository: TodoRepository {
    private(set) var fakTodoList:[Todo]
    init(list: [Todo] = []) { self.fakTodoList = list }
    
    func fetchTodos() -> [Todo] {
        fakTodoList
    }
    
    func addTodo(title: String) -> Todo {
        let new = Todo(id: UUID(), title: title)
        fakTodoList.append(new)
        return new
    }
}
