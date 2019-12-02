# RxSwiftDemo
This repo demonstrates how you can use RxSwift in the front-end of your app

Uses the following ideas of MVVM-C style:

-  Models hold application data. They’re usually structs or simple classes.
- View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.
-   Using the coordinator pattern in app lets us remove the job of app navigation from our view controllers

Features:

- Demonstrates usage of `RxSwift` for `rest API call` and how to handle `UITableView`
- Removes delegation pattern and uses `Observables` for communication between view controllers
- Includes a News API for searching and retrieving live articles. You need an API key to use the API and you can get one here: [get API key](https://newsapi.org/register).


Dependencies:

-   Xcode11
-   Cocoapods

How to run:

-   `git clone https://github.com/valcicivo/RxSwiftDemo.git`
-   `cd RxSwiftDemo`
-   `pod install`
-   `open RxSwiftDemo.xcworkspace`
