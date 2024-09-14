# Introduction
Character Challenge is an iOS application designed to demonstrate clean architecture principles practically. This app showcases various functionalities, and this documentation provides a detailed insight into its technical intricacies and design choices.

## Requirements
- Xcode 15.1
- iOS 16.0
- SwiftLint 0.56.2
- Fastlane 0.6.5

##  App Features
- Character List
- Character Details 

## Used In the App
- SwiftUI
- UIKit
- Combine
- DIContainer: Dependency Injection
- Coordinator, Repository, Builder, Factory, Singleton patterns ...etc
- SwiftLint
- Fastlane
    - Run SwiftLint

## Dependencies
- [x] [Core](https://github.com/ramynasser/CharacterChallenge/tree/main/CharacterChallenge/Core)
- [x] [Data](https://github.com/ramynasser/CharacterChallenge/tree/main/CharacterChallenge/Data)
- [x] [Domain](https://github.com/ramynasser/CharacterChallenge/tree/main/CharacterChallenge/Domain)
- [x] [DesignSystem](https://github.com/ramynasser/CharacterChallenge/tree/main/CharacterChallenge/DesignSystem)


# Design System
Building a scalable application requires reusability and consistency in design. To address these concerns, this Swift Package, named Design System, provides a centralized way to manage UI components and styling that can be shared across multiple applications within an organization. This ensures reusability, scalability, and standardization across different projects.

### Structure and Flexibility

The Design System is built with flexibility in mind. It defines a base structure that allows each application or theme to have its own design values while maintaining a consistent underlying structure. This enables easy customization and ensures that the design system can scale to multiple applications.

Each application or theme can configure the design system with its specific set of values. Here's an example:


```
import DesignSystem

  Fiber.shared.setupTheme(theme: CharacterDesignSystem.apptheme)
```

Initially, the system handles colors, but it is designed to evolve and accommodate a wide range of tokens such as:

- [x] Typography
- [x] Padding
- [x] Sizing
- [x] Colors

### Components

The Design System package includes reusable components, extensions, and resources like fonts and assets. These components are built to promote consistency while being flexible enough to adapt to various app themes. The main components include:

- [x] ContentView: Displays the main content of the application.
- [x] EmptyView: A customizable view used to show empty states.
- [x] LoadingView: Displays a spinner to indicate a loading state.
- [x] NavBar: A reusable navigation bar component for easy integration.
- [x] GridView: A flexible grid layout component for arranging views.
- [x] RemoteImage: A view for asynchronously loading and displaying images.

Each of these components is designed to be customizable, easily integrated into different applications, and theme-aware, ensuring that they can be reused and adapted based on the specific needs of each project.

### How to Use
To use the Design System in your application, simply import the package and configure it based on the theme for your app.

```
import DesignSystem

  Fiber.shared.setupTheme(theme: CharacterDesignSystem.apptheme)
```

# Core
Swift package for the core layers, This package consists of libraries for the core layers inside the app, Such as: 

[Extensions, Utilities, Mappers, Typealias]

### Networking 
URLSession-based Network layer, Remote Response Handler, Local Response Handler, Error Handler, ...etc
### Logger
Initially, We had only the system logger engine that debug print the log messages, But it's open for extension and adding new engines

# App Architecture

This app is using Clean Architecture separated the **Domain** and **Data** in separate Swift Packages to be reused inside the application, Giving us the required scalability level away from the presentation layer,
And, the **Presentation** layer is on the app side and separated by **module/feature/screen**

### Domain layer
The Domain layer consists of the **UseCases, RepoProtocols, And the Entities**
It also has the actual **UseCase Implementation**.

### Data layer
The Data layer consists of **DataSources, Endpoints, ReposImplementation, DTOs**. 

### Presentation Layer
The Presentation layer is an app-side containing the Modules, Features, and screens.
The presentation layer is built using the **MVVM With Coordinator** presentation architecture.

### How the App. & Layers communicating?
As we are separating the **domain and data** layers from the application and presentation layer, We need to handle the communication between the layers and the application side, We have the CoreData library that enables the application side to setup the data with the configuration and inject the dependencies that the data package need to run, We have the AppConfig and the APIConfig for this mission.

# Unit Testing
- [x] [Use Cases Tests](https://github.com/ramynasser/CharacterChallenge/tree/main/CharacterChallenge/Domain/Tests/CharacterDomainTests)
- [x] [View Model Tests](https://github.com/ramynasser/CharacterChallenge/tree/main/CharacterChallengeTests)

