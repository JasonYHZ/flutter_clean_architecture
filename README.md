# Flutter Clean Architecture

[中文](README.ZH.md) | [English](README.md)

This is a scaffolding type project that uses Riverpod to implement a clean architecture for state
management applications. The application is built with a focus on clean code and architecture,
making it easy to maintain and
extendable. It uses Riverpod for state management.

## Key features

- [x] The structure of the application follows a clean Make the code base easy to navigate and understand.
- [x] Riverpod is used to manage application state.
- [x] Theme switching: Users can switch between light and dark themes to enhance the user experience.
- [x] Language switching: The application supports multiple languages.
- [x] Web Requests: The application supports web requests using Dio.
- [x] Database: The application uses Drift to interact with a local SQLite database.
- [x] Application uses freezed and json_annotation libraries to simplify serialising and deserialising JSON data.
- [x] Uses shared_preferences to store user preferences such as selected themes and languages.
- [ ] Support for real-time communication using Websocket.
- [ ] The application includes business logic unit tests to ensure that the application functions as
  expected and that the application works as expected.

## Architecture Description

![Clean Architecture](arch.png)

Based on the DDD design philosophy and the layered code organisation of the Onion Architecture, a
Clean Architecture was developed.
Based on the DDD design concept and the code organisation of the Onion Architecture, the Clean
Architecture is designed to divide the application into three domains: domain, data, and
presentation, which may vary from project to project, but the core idea is more or less the same.
The core idea is to reduce the coupling between different parts of the application through a
reasonable hierarchical structure, so that it is easy to maintain and extend.

In this architecture, the layers are not stacked on top of each other; rather, they are similar to
the layers of an onion. Each layer has access to its inner layer or its own sibling layer, but not
to the outer layer. This structure allows for less coupling between the various parts of the
application, making it easier to maintain and extend.

### Domain

The Domain layer is the core layer of the application, containing the business logic and domain
model of the application, and is not dependent on any other layer. It is not dependent on any other
layer. Dart module, the layer package contains roughly the following:

- Models: Models, containing the data model of the application.
- Repositories: Domain repositories that define the interface between the application and the data layer.
- Use cases: use cases, which contain the core business logic of the application and do not need to know the specific implementation of the data source, regardless of where it comes from, because these specific implementation details have been abstracted out of the interface and implemented by the data layer.

### Data

The Data layer is the data layer of the application and is responsible for interacting with data sources. It contains the following:

- Entity: the entity model, which is different from Models in that Entity is the model associated with the data source.
- Data sources: Data sources, responsible for interacting with data sources.
- Repositories: data repositories that implement the interfaces defined at the Domain level.

### Presentation

The Presentation layer is the representation layer of the application and is responsible for interacting with the user. This is where Flutter is actually written. It contains the following:

- UI: The user interface, which contains the interface elements of the application.
- View models: view models, which are responsible for managing the state and business logic of the interface.
- State management: state management, responsible for managing the state of the application.

> Here, you can use not only riverpod but also other state management libraries, such as provider, Bloc, and so on.