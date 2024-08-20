# TomTomSDKOfflineFrameworks

The TomTomSDKOfflineFrameworks package provides iOS modules to build "offline" navigation applications requiring no internet connectivity.

> Offline functionality for Maps SDK and Navigation SDK for iOS is only available upon request.[Contact us](https://developer.tomtom.com/tomtom-sdk-for-ios/request-access) to get started.

## Requirements

1. Xcode 14.2+
1. Swift 5.7+
1. Deployment target: iOS 13+

## Installation
### Getting access
1. Because the artifacts for Offline SDK are private, you will need to [Contact us](https://developer.tomtom.com/tomtom-sdk-for-ios/request-access) to get access.
2. Once you have obtained access, go to [repositories.tomtom.com](https://repositories.tomtom.com) and log in with your account. Expand the user menu in the top-right corner, and select `Edit profile` → `Generate an Identity Token`. Copy the generated token and use it to specify your credentials in the `~/.netrc` file. If the `~/.netrc` file doesn’t exist, create one and add the following entries:
    * Replace the `USERNAME_PLACEHOLDER` with the login username or email you use for [repositories.tomtom.com](https://repositories.tomtom.com).
    * Replace the `IDENTITY_TOKEN_PLACEHOLDER` with the generated identity token.
    * Add a new line to the end of the `~/.netrc` file to avoid parsing errors.
    ```
    machine repositories.tomtom.com
    login <USERNAME_PLACEHOLDER>
    password <IDENTITY_TOKEN_PLACEHOLDER>
    ```
### Adding the TomTomSDKOfflineFrameworks package to your Xcode project
1. Add a package dependency to your Xcode project:
    1. Ensure you finished the [Getting access](#getting-access) steps.
    2. Select `File` → `Add Package Dependencies...` (or `File` → `Add Packages...` in Xcode 14).
    3. Enter the next URL in a search field: https://github.com/tomtom-international/tomtom-sdk-spm-offline
    4. Set `Dependency Rule` to `Exact Version`.
        > We recommend using the `Exact Version` to have a consistent resolution.
    5. Ensure the `Add to Project` field contains your project.
    6. Click `Add Package` and wait for the Xcode to resolve the package.
    7. You should see the list of `Package Products`.
    8. Select a product you want to add to your project.
    9. And click `Add Package`.
2. Add more products to your target:
    1. Select your project in the Xcode Project Navigator.
    2. Select the target to which you want to add dependencies.
    3. Select the `General` section and scroll down to the `Frameworks, Libraries, and Embedded Content` list.
    4. Click `+` button.
    5. Select the products you want to add and click the `Add` button.
### Adding the TomTomSDKOfflineFrameworks package to your SPM package
1. Ensure you finished the [Getting access](#getting-access) steps.
2. Add next line to your package dependencies in the `Package.swift` file:
    ```swift
    .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-offline", exact: "0.58.0")
    ```
    > We recommend using the `exact` version to have a consistent resolution.
3. Add next required module to your target dependencies in the `Package.swift` file, e.g.:
    ```swift
    .product(name: "TomTomSDKSearchOffline", package: "tomtom-sdk-spm-offline")
    ```
4. The resulting package might look like this:
    ```swift
    let package = Package(
        name: "MyLibrary",
        platforms: [.iOS(.v14)],
        products: [
            .library(name: "MyLibrary", targets: ["MyLibrary"]),
        ],
        dependencies: [
            .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-offline", exact: "0.58.0")
        ],
        targets: [
           .target(name: "MyLibrary", dependencies: [
                .product(name: "TomTomSDKSearchOffline", package: "tomtom-sdk-spm-offline")
                /* add more products here */
           ]),
        ]
    )
    ```