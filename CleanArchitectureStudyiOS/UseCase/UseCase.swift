//
//  UseCase.swift
//  CleanArchitectureStudyiOS
//
//  Created by eric.yu on 9/9/25.
//

import Foundation

struct FetchTodosUseCaseImpl: FetchTodosUseCase {
    let repo: TodoRepository
    func execute() -> [Todo] {
        repo.fetchTodos()
    }
}

struct AddTodoUseCaseImpl: AddTodoUseCase {
    let repo: TodoRepository
    func executed(title: String) -> Todo {
        repo.addTodo(title: title)
    }
}
