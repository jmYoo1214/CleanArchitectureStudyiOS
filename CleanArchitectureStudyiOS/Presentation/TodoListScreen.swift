//
//  TodoListScreen.swift
//  CleanArchitectureStudyiOS
//
//  Created by eric.yu on 9/9/25.
//

import SwiftUI

struct TodoListScreen: View {
    @StateObject var viewModel: TodoListViewModel
    var body: some View {
        VStack {
            HStack {
                TextField("할 일 입력", text: $viewModel.newTitle)
                    .textFieldStyle(.roundedBorder)
                Button("추가") {
                    viewModel.addTodo()
                }
            }.padding()
            
            List(viewModel.todos) { todo in
                Text(todo.title)
            }
        }
    }
}

#Preview {
    let repo = InMemoryTodoRepository()
                let fetch = FetchTodosUseCaseImpl(repo: repo)
                let add = AddTodoUseCaseImpl(repo: repo)
        TodoListScreen(viewModel:  TodoListViewModel(fetch: fetch, add: add))
}
