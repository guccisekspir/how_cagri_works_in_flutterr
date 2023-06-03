## How Cagri Works on Flutter

This project is mock project which show my working style on Flutter. I will explain step by step in this file. This projects main purpose is showing my working style & principle so creating working perfect app is not on purpose :-) 

## Theming

Theming is most important feature for mobile applications. Flutter provide base theming feature but sometimes FlutterTheme cant be enough for your project. So I created my own Theming structure for implement in projects. Theming functions should be implement on beggining on project because theming using in almost everywhere! So migration can be painful🥵

I am using Extension for Theming in my Flutter Projects. You can find my sample logic in [here](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/theming/theming.dart).

## Helpers

In Flutter some logics are using multiple time. Like Device Frame Size, TextStyles, Customized Buttons etc. So I am creating generic helpers singeleton classes for provide this information

For Example [SizeHelper](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/theming/m_size.dart)
Mostly I am using portional approach for responsive design. So I need to reach device size multiple time multiple time. So I created [SizeHelper](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/theming/m_size.dart) classes for this. Instead of access device height every time calling with 
```dart
MediaQuery.of(context).size.height
```
I am calling SizeHelper().height. ✨ ✨ ✨

Another Example is [Gap](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/theming/m_gap.dart),
In UI developers are always using Gap for give some blank space between Widgets acccording Design. For being consistent I created [MGap](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/theming/m_gap.dart) classes which provide blank widget. So when designer changed Gap language I can change easily. 


## Navigation

Mostly I am using Navigator 3.0 as much as possible in projects. My favorite navigator packages is GoRouter. I prefer GoRouter because 

- GoRouter is pretty easy to use and initialize, no need any extra code generation flow. This code blocks is enough for initialize 🪄
```dart
import 'package:go_router/go_router.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
```
- If you choose to use packages which provide MAJOR functions like navigation you need to be careful. Since Flutter is new framework, it always changing so your packages should be up to date. So developer of packages is really important. Short time ago GoRouter became Flutter official packages so this is HUUUUGE advantage 💪🏼💪🏼💪🏼
- Supported features: GoRouter supports DeepLinking, Web, Redirection. So this is also good advantages.

 [Here ](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/utils/router.dart)my sample GoRouter implements



## State Managements

I used to use only BLoC as a state management in my Flutter projects. BLoC is realy good state management because it is suitable for structured architecture, provide Single-responsibility principle which part of SOLID also developer's is crazy!

But sometimes BLoC is not enough for manage states. So in my new projects I started to use Riverpod and BLoC together. So let me tell you with examples.

When I want to manage state for complicated and progress align scenario I use BLoC. For example in this project I can give Auth flow. In Auth there are a lot of flows and states. And we need to act according this states. So BLoC is really good solution for this case. 
You can see my sample BLoC implementation in [here](https://github.com/guccisekspir/how_cagri_works_in_flutterr/tree/main/lib/blocs/auth_bloc/bloc)

But when I want to store some states and reuse on different places, Provider is better solution. For example AppTheme or CurrentUser. If I want to store my UserState alive and re-use in different places I create provider for this.

[Here](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/providers/current_user_provider.dart) you can find my current user provider implementation

## Business Logic & Project Architecture

In Flutter I am using BLoC Pattern architecture. In a summary, there are 3 layers. Presentation Layer, Domain Layer, Data Layer. 

- Presentation Layer means consuming BLoC and present data in UI. So [this is example](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/pages/auth_page/auth_page.dart) of Presentation Layer in this project.

- Domain Layer is responsible for business logic. In this project [repositories](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/data/auth_repository.dart) and [blocs](https://github.com/guccisekspir/how_cagri_works_in_flutterr/tree/main/lib/blocs/auth_bloc/bloc) are example of domain layer.

- Data Layer is responsible for communicate with server-side data.In this projecty [apiClients](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/data/auth_api_client.dart) are example of data layer.


## Extensions

Extensions are really good and strongfull feature in Flutter. In my projects I try to use as possible as extensions. 

For example create function that give Ordinal number format for integers. This function is not available on Dart Int so we need to create extension and provide this function.
[Here](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/extensions/int_ext.dart) my int extension implementation.


Also you can find my other base extensions in [here](https://github.com/guccisekspir/how_cagri_works_in_flutterr/tree/main/lib/extensions).

## Logger

Logging is really important for mobile application development. Mostly testing phase is done by QA or other team member and mostly QA or testers dont have strongful technical background. So as Mobile Engineer we need to provide all datas correctly and easily. In this purpose I am using [CRLogger](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/e2e1474b64422661d849b1304f7028917520d141/lib/main.dart#LL19C43-L19C43) packages which developer is CleverRoad. Determine the http request, results,errors & inputs is really easy with this packages and also CRLogger support Dio which my favorite http client. 

## Models

Since Dart is OOP(Object Oriented Programming) developers use models. Mostly I am using [QuickType](https://app.quicktype.io/) for creating Dart Classes according Json. [Here sample output](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/models/kipss_user.dart) of QuickType

## Global Widgets

If one widget are using in multiple time in different files I create Global Widgets. For example SpamBlocker. In Flutter as developer we make sure that users do not abuse, like tapping buttons fast & multiple time. So I created solution named SpamBlocker. SpamBlocker will be using in multiple widget which have Gesture functions. Here my [SpamBlocker implementation](https://github.com/guccisekspir/how_cagri_works_in_flutterr/blob/main/lib/global/widgets/spam_blocker.dart).

You can find my other Global widgets [in here](https://github.com/guccisekspir/how_cagri_works_in_flutterr/tree/main/lib/global/widgets)

