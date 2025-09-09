//
//  Todo.swift
//  CleanArchitectureStudyiOS
//
//  Created by eric.yu on 9/9/25.
//

import Foundation

struct Todo: Identifiable, Equatable {
    let id: UUID
    var title: String
}

protocol TodoRepository {
    func fetchTodos() -> [Todo]
    func addTodo(title: String) -> Todo
}

protocol FetchTodosUseCase {
    func execute() -> [Todo]
}

protocol AddTodoUseCase {
    func executed(title: String) -> Todo
}
