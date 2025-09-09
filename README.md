# 🧼 CleanArchitectureStudyiOS

SwiftUI 기반으로 **Clean Architecture**를 학습하기 위한 샘플 프로젝트입니다.  
간단한 **Todo 리스트 앱**을 통해 Domain / Data / Presentation 계층을 분리하여  
유지보수성과 테스트 용이성을 높이는 방법을 다룹니다.

---

## 📐 아키텍처 개요

본 프로젝트는 Robert C. Martin의 Clean Architecture 원칙을 기반으로 설계되었습니다.

- **Domain Layer**
  - 엔티티(`Todo`)
  - 유스케이스(`FetchTodosUseCase`, `AddTodoUseCase`)

- **Data Layer**
  - 저장소 인터페이스 구현(`InMemoryTodoRepository`)
  - DTO/Mapper (네트워크 확장 시 활용 가능)

- **Presentation Layer**
  - SwiftUI View + ViewModel (`TodoListViewModel`, `TodoListScreen`)
  - 단방향 데이터 흐름 (Input → UseCase → Output)

---

🌱 향후 개선 방향
	•	async/await 기반 네트워크 레이어 추가
	•	로컬 DB (CoreData/Realm/SQLite) Repository 구현
