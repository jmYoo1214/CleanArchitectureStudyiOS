//
//  InMemoryTodoRepository.swift
//  CleanArchitectureStudyiOS
//
//  Created by eric.yu on 9/9/25.
//

import Foundation

final class InMemoryTodoRepository: TodoRepository {
    private var todoArray: [Todo] = []
    
    func fetchTodos() -> [Todo] {
        todoArray
    }
    
    func addTodo(title: String) -> Todo {
        let new = Todo(id: UUID(), title: title)
        todoArray.append(new)
        return new
    }
}
