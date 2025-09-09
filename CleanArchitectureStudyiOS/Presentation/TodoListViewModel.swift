//
//  TodoListViewModel.swift
//  CleanArchitectureStudyiOS
//
//  Created by eric.yu on 9/9/25.
//

import Foundation

@MainActor
final class TodoListViewModel: ObservableObject {
    @Published private(set) var todos: [Todo] = []
    @Published var newTitle: String = ""
    
    private let fetch: FetchTodosUseCase
    private let add: AddTodoUseCase
    
    init(fetch: FetchTodosUseCase, add: AddTodoUseCase) {
        self.fetch = fetch
        self.add = add
        load()
    }
    
    func load() {
        todos = fetch.execute()
    }
    
    func addTodo() {
        guard !newTitle.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let new = add.executed(title: newTitle)
        todos.append(new)
        newTitle = ""
    }
}
