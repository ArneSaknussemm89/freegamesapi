# Free Games API
This app uses the Free Games API to fetch games from the [Free Games API](https://www.freetogame.com/api-doc).

## Koality Flutter

A boilerplate project for CK's Flutter apps. (Adapted from [Flutter App Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction))
  
![image](assets/Clean%20Architecture%20-%20Flutter.png)

## Architecture Design
In order to keep code organized and searchable, we follow a slightly modified Domain-Drive Feature-First Architecture.
Folder structure is as follows:

```
- assets/
- lib/
  - application/
  - core/
  - data/
  - domain/
  - features/
    - feature_a/
      - application/
      - data/
      - domain/
      - presentation/
  - presentation/
```

Each folder is described further below. `Application`, `Data`, `Domain` and `Presentation` are the 4 layers of the architecture. `Core` defines 
classes and utility objects that are used within these 4 layers. The layers are described in more detail below.

Features contains all of the features of our application. Typically we define a feature as separate if it has at least it's own domain and presentation layers.

---

### Presentation Layer
The presentation layer is where we define how our UI is rendered. It contains all of the blocs, widgets and view models that are used to render the UI.
Widgets should be composable and contain little to no logic. If a UI component requires it's own internal logic, it should be created as a ViewModel.
The folders allowed here are `widgets` and `view_models`.
* **View Models** are logical wrapper classes around domain objects. If some logic is needed for domain objects before being used in the UI, then a ViewModel
class should be used. It could keep track of callbacks, streams, or other logic that does not belong as a use case. Typically this would be used for transforming values, combining model/value object values or doing things like validating data.
* **Widgets** are you classic Flutter Widget UI Components. They should be "dumb" in the sense of being pure widgets. They should get passed data in their
constructor and the most logic they should have it showing/hiding UI elements.
---

### Application Layer
The application directory contains the Use Cases that describe the app specific behavior or "Business Logic" as it's referred to
in other paradigms. This is where we store Services and Use Cases. The folders
allowed here are `blocs`, `services` and `use_cases`.

* **Blocs** Blocs created using the `graph_bloc` that are FSMs that define a state graph using States/Events.
* **Services** Are generic classes that typically handle doing some I/O operations. A common use is to store use cases that can be triggered when requested.
* **Use Cases** are the way we describe the business logic of our app. These can be thought of as Action Classes; they are passed parameters and
then execute their logic and return either a result or an error. All Use Cases extends one of the `UseCase` classes. `AsyncUseCase` is used
for use cases that are executed asynchronously, `UseCase` is used for use cases that are executed synchronously, and finally `StreamUseCase` 
is used for use cases that are executed as or on a stream. Use Cases should all be created as Providers so they can be read by other services,
repositories, blocs or anything else that needs to execute some logic.

This classification ideally helps create a clear list of "logical features" that our app executes. It will serve as a list of User Stories that
we should be testing against.

---

### Domain Layer
This layer is where we define all of the entities associated with either the application as a whole or of the feature it's used in.
`models` and `value_objects` are the two directories that can exist here.

* **Models** are uniquely indentifiable entities that are managed and updated and long-lived.
* **Value Objects** are short-lived, immutable and are treated as equal if the values match. They are essentially data structs.
A `User` would be a model and a `LoginCredential` used for passing a username/password to a Use Case would be a value object.

---

### Data Layer
Finally the Data layer is where we place repositories, data sources and adapters. `repositories`, `data_sources` and `adapters` are the three directories that can exist here.
* **Repositories** are service classes that hold data source(s) and adapter(s) and return models. Typically are `CRUD` operator classes.
* **Data Sources** define the shape and location of a source of data. Typically this would be an API, local database or a key-value store. The Data Sources are in charge of fetching data using an Adapter and returning the raw information.
* **Adapters** are classes that define behaviors that Data Sources use to fetch information. So a `DioHttpAdapter` would be a class that creates the `Dio` instance and uses it to make HTTP requests. But the class simply exposes generic methods like `get` and `post` and returns a generic response type `(Map<String, dynamic> / List<Map<String, dynamic>>)`.

---

## State Management

This default approach for state management is a combination of the [bloc](https://pub.dev/packages/bloc) and [graph_bloc](https://pub.dev/packages/graph_bloc) packages. States used by the UI will be created as FSM (Finite State Machines) to make them predictable and declarative.

## Dio

We use Dio for making HTTP calls as it's more robust, but is also easy to configure for initial set up. [Dio](https://pub.dev/packages/dio) This will be
the default adapter used by Data Sources for external data.

## Alice HTTP Inspector

Using the Alice package for debugging HTTP calls made with Dio. [Alice](https://pub.dev/packages/alice)

## Domain and Data Models

For data models, we will be using the [freezed](https://pub.dev/packages/freezed) package to have fully featured data structs with tear-off constructors, deep copyWith methods
and the ability to have Unions, Sealed Classes and even Tuples.
