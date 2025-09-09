//
//  CleanArchitectureStudyiOSApp.swift
//  CleanArchitectureStudyiOS
//
//  Created by eric.yu on 9/9/25.
//

import SwiftUI

@main
struct CleanArchitectureStudyiOSApp: App {
    var body: some Scene {
        WindowGroup {
            let repo = InMemoryTodoRepository()
            let fetch = FetchTodosUseCaseImpl(repo: repo)
            let add = AddTodoUseCaseImpl(repo: repo)
            TodoListScreen(viewModel: TodoListViewModel(fetch: fetch, add: add))
        }
    }
}
