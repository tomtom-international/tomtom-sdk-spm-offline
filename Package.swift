// swift-tools-version: 5.7

// © 2022 TomTom N.V. All rights reserved.
//
// This software is the proprietary copyright of TomTom N.V. and its subsidiaries and may be
// used for internal evaluation purposes or commercial use strictly subject to separate
// license agreement between you and TomTom N.V. If you are the licensee, you are only permitted
// to use this software in accordance with the terms of your license agreement. If you are
// not the licensee, you are not authorized to use this software in any manner and should
// immediately return or destroy it.

import PackageDescription

let sdkVersion = "0.35.0"

let package = Package(
    name: "TomTomSDKOfflineFrameworks",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [ /* products are set later */ ],
    dependencies: [
        .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-core", exact: Version(stringLiteral: sdkVersion)),
        .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-navigation", exact: Version(stringLiteral: sdkVersion)),
    ],
    targets: [ /* targets are set later */ ],
    swiftLanguageVersions: [.v5]
)

let modules: [Module] = [
    Module("TomTomSDKDataManagementOffline", sha: "1946b54e331648d44ada09f9a374d744db8e4725c21e7e777edc79876fece073", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardMapUpdateInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardOpenLRInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKNetworking"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKBindingNavigationTilingInternal"),
    ]),

    Module("TomTomSDKNavigationDataStoreHybrid", sha: "47a755ea49cd1fe02a13beebdb4ae1cbcd779890f9181c5b24156c01be3e7c88", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKBindingFrameworkHTTPInternal"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
    ]),

    Module("TomTomSDKDataSourceSelectionEngine", sha: "7b8f75722317b75f85ad0885d4ea992f0afe0daa5ef9ab5eaec8b3dee15101cf", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKBindingFrameworkHTTPInternal"),
        .corePackageModule("TomTomSDKBindingFrameworkLoggingInternal"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderOffline", sha: "103fc18e39a8d8745b5efa7b300cf1e55f357cf1e5e3d61844ca3f34edfda802", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingMapDisplayOnboardDataProviderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderHybrid", sha: "6efcbae45d0cd0a5c92af41ebf17f590ea3f4585cf1a24d8d1ab060c403c008f", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKMapDisplayDataProviderOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKReverseGeocoderOffline", sha: "4951b4c7df4c1725560f3ac8ef185940ca4eee1bec64f0a4407ba801b7bfe3fb", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardReverseGeocoderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardReverseGeocoderInternal", sha: "422779ce07e1d412f6d926dedf9ad6efa55f70e9506720ae83ebd429087be164", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
    ]),

    Module("TomTomSDKRoutePlannerOffline", sha: "1e43946ee62696ed5e79c17cec4ac8107edee8300711c44b08683f903f07a88c", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKTrafficTPEG"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKTraffic"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKPersonalDataOffline", sha: "c347160299b8baaef4fd73cdf76fa5d5a6c5c09eae83d6a25c4ed9e11fe207e7", version: "0.35.0", dependencies: [
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKSearchOffline", sha: "57a3084b6788e0caa642ae4e98cdbc70865b80714788f8e1d1dfe81e53c3d65a", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        // navigation package dependency
        .corePackageModule("TomTomSDKPersonalData"),
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKSearchOfflineCommon", sha: "bd299b046ba6aa194ee37fccbc6c5caf5d9a2bd341652578df30c564690589c9", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKSearchOnlineCustomData", sha: "d57d056c0d6878fa05474bc6287fe31ff3a28d3a63583eec1df78b2c6ca47a6c", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchOnline"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKBindingOnboardSearchInternal", sha: "799aa2c441d33df55e40ce5a8d9ec138db771f499ebc0f72dc7b3a65864b78f9", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
    ]),

    Module("TomTomSDKBindingOnboardStructuredSearchInternal", sha: "88dec36ca6415ead93e8b5a063b9d46b39bb94a578e5854eb970001ae832b4ff", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
    ]),

    Module("TomTomSDKStyleProviderOffline", sha: "25322cb49e170add9e8d78ae90096c1cdaceb302394ee3c84ddcb70d256f982e", version: "0.35.0"),

    Module("TomTomSDKMapMatchingEngineOffline", sha: "70788d9820752d15b97bdb154b372fc1b776437bf2af370ef1409ed9f32cf496", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKBindingMapMatchingInternal"),
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKMapMatchingEngineCommon"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
    ]),
    Module("TomTomSDKMapMatchingEngineHybrid", sha: "9d2023b35cfb735a853ed62c6e6f92cc05d0d6e829a6746d36dc90ec7a09b322", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKMapMatchingEngineTileStore"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
    ]),
    Module("TomTomSDKRouteProjectionEngineOffline", sha: "4b6ddac8b0c863323515ff849d80a3bb6a55ef0d4a5e9bff87b62b62cf44f4ee", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKBindingRouteProjectionInternal"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineCommon"),
    ]),
    Module("TomTomSDKRouteProjectionEngineHybrid", sha: "046099c1a8df04a5a8e116ba97a51c899dd3e1fc3f1cd3e5185cab41dc6cb604", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKRouteProjectionEngineOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependency
        .corePackageModule("TomTomSDKRoute"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKBindingRouteProjectionInternal"),
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineTileStore"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineCommon"),
    ]),
    Module("TomTomSDKBindingNDSSQLiteInternal", sha: "9087500365648844132c82ec89d4d682eb2a352b45118b4cfdb49a06cdb1200d", version: "0.35.0"),
    Module("TomTomSDKBindingNDSStoreAccessInternal", sha: "b86e203f011d85b1fb105b0953dcb433709e6ec6a54555e4509cd80b5c69d40a", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingOnboardMapUpdateInternal", sha: "b0f9ff3ff938c3a90e2934d7323874214dd7b029b1c90cbea06229b89957c3df", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingMapDisplayOnboardDataProviderInternal", sha: "0dc33c5ef6845119f62918700d27645e6feaefe65cec8cb0112b921b5f3d17d9", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
    ]),
    Module("TomTomSDKTrafficTPEG", sha: "c3707966f38c9740d83c16de76756ab051e54f4e86c587ee2c26b421f0e7df04", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingTPEGTrafficInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKTraffic"),
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKNetworking"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingTPEGTrafficInternal", sha: "206ddef31540915cc6336c1d3e2bb913b89410bdc086e700a0f82c492b0a6198", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKReverseGeocoderHybrid", sha: "a969b540040755a71547d9dea2f1effcc46f3409ee7e754b5fc66fe87554fe85", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKReverseGeocoderOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        .corePackageModule("TomTomSDKReverseGeocoderOnline"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKRoutePlannerHybrid", sha: "d3f0fb3bfb2db672d66d9b04a89fa737a4c6334f39fc5b87b1bc05152d4884e6", version: "0.35.0", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
    ]),
    Module("TomTomSDKRouteReplannerHybrid", sha: "e4f3dcdac6b774153b32a0657e8808acfe4147a552ec212103350c302913cce4", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKRoutePlannerHybrid"),
        .offlinePackageModule("TomTomSDKRoutePlannerOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutingCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKRoutePlanner"),
        .navigationPackageModule("TomTomSDKRoutePlannerOnline"),
        .navigationPackageModule("TomTomSDKRouteReplanner"),
        .navigationPackageModule("TomTomSDKRouteReplannerInternal"),
    ]),
    Module("TomTomSDKBindingOnboardDirectionsInternal", sha: "e0716987036936036f4b46032bd96078bd626ca141e7156438631dc3055df3e6", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
        // core package dependency
        .corePackageModule("TomTomSDKBindingFrameworkLoggingInternal"),
    ]),
    Module("TomTomSDKSearchHybrid", sha: "50ae7aaf9cc0645dc1412ad22c5003a0283ef44007ca1b4e2c29dd7f0618c76f", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKSearchOffline"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependency
        .corePackageModule("TomTomSDKPersonalData"),
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchOnline"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKStructuredSearch", sha: "089d04ffef8f7a21999c5e1735836f56e55a2643fd85e43d8ad6e155a7f0da3d", version: "0.35.0", dependencies: [
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKStructuredSearchOffline", sha: "fb8b90edd92805f519e9247898e7df6e29d1e11b869b05b86ce072b172a1883a", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardStructuredSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKStructuredSearch"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardOpenLRInternal", sha: "96cd928a62ac819d71722ad86f69dffb461956952660397b4c1415d73942965d", version: "0.35.0"),
    Module("TomTomSDKBindingVehicleHorizonNDSMapInternal", sha: "4a8d6cc062572f3ad4dfddd83c266ce9d65b8194e2d4e5222699b0b89e4449f9", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKHorizonEngineOffline", sha: "fe7b765fb8ed80e8b29730eff4ab6badb8b41c34dfcb51147b6b623203c85ee6", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingVehicleHorizonNDSMapInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationHorizonDataAdapter"),
        .navigationPackageModule("TomTomSDKHorizonEngineCommon"),
        .navigationPackageModule("TomTomSDKUnifiedLocationDecoder"),
    ]),
    Module("TomTomSDKHorizonEngineHybrid", sha: "b2a2b51893183d53f9dc62d9b17cf3dd29091624bbacf7a4bad473a6a6143c12", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        .offlinePackageModule("TomTomSDKHorizonEngineOffline"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
        .navigationPackageModule("TomTomSDKNavigationHorizonDataAdapter"),
        .navigationPackageModule("TomTomSDKHorizonEngineCommon"),
        .navigationPackageModule("TomTomSDKHorizonEngineTileStore"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKNavigationOffline", sha: "a1ab3b9adb5114f1fd273f388b4cf803067bb5e923ae6105d9b972303600d02d", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKHorizonEngineOffline"),
        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKRouteProjectionEngineOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKVehicle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigation"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKDataStoreMaintenanceEngine"),
        .navigationPackageModule("TomTomSDKRouteReplanner"),
    ]),
    Module("TomTomSDKNavigationHybrid", sha: "4c232f154dedcfb9bc007e26e3d5dcf19c98f29313287fc8a7486c2639811ee6", version: "0.35.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKDataSourceSelectionEngine"),
        .offlinePackageModule("TomTomSDKRoutePlannerHybrid"),
        .offlinePackageModule("TomTomSDKRoutePlannerOffline"),
        .offlinePackageModule("TomTomSDKMapMatchingEngineHybrid"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        .offlinePackageModule("TomTomSDKRouteProjectionEngineHybrid"),
        .offlinePackageModule("TomTomSDKRouteReplannerHybrid"),
        .offlinePackageModule("TomTomSDKHorizonEngineHybrid"),
        // core package dependencies
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKVehicle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigation"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKDataStoreMaintenanceEngine"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
        .navigationPackageModule("TomTomSDKRoutePlanner"),
        .navigationPackageModule("TomTomSDKRouteReplanner"),
        .navigationPackageModule("TomTomSDKRoutePlannerOnline"),
    ]),
]

package.products = modules.products
package.targets = modules.targets

private extension String {
    func artefactUrl(version: String) -> String {
        "https://repositories.tomtom.com/artifactory/spm/TomTomSDK/Offline/binaries/\(self)/\(version)/\(self).zip"
    }

    var wrapperName: String {
        return self + "Wrapper"
    }
}

struct Module {
    let frameworkName: String
    let sha: String
    let dependencies: [ModuleDependency]
    let version: String
    let isProduct: Bool

    init(_ frameworkName: String, sha: String, version: String, isProduct: Bool = true, dependencies: [ModuleDependency] = []) {
        self.frameworkName = frameworkName
        self.sha = sha
        self.version = version
        self.isProduct = isProduct
        self.dependencies = dependencies
    }

    var product: Product? {
        return isProduct ? .library(name: frameworkName, targets: [wrapperName]) : nil
    }

    var wrapperName: String {
        frameworkName.wrapperName
    }

    var targets: [Target] {
        let binaryTargetDependency: Target.Dependency = .target(name: frameworkName)
        let dependenciesTargets: [Target.Dependency] = dependencies.map { $0.dependency }
        let mainTargetDependencies = [binaryTargetDependency] + dependenciesTargets
        let mainTarget: Target = .target(name: wrapperName, dependencies: mainTargetDependencies)
        let binaryUrl = frameworkName.artefactUrl(version: version)
        let binaryTarget: Target = .binaryTarget(name: frameworkName, url: binaryUrl, checksum: sha)

        return [mainTarget, binaryTarget]
    }
}

struct ModuleDependency {
    let name: String
    let package: String?

    var dependency: Target.Dependency {
        if let package = package {
            return .product(name: name, package: package)
        }

        return .target(name: name.wrapperName)
    }

    static func packageDependency(_ name: String, package: String) -> ModuleDependency {
        ModuleDependency(name: name, package: package)
    }

    static func corePackageModule(_ name: String) -> ModuleDependency {
        ModuleDependency(name: name, package: "tomtom-sdk-spm-core")
    }

    static func navigationPackageModule(_ name: String) -> ModuleDependency {
        ModuleDependency(name: name, package: "tomtom-sdk-spm-navigation")
    }

    static func offlinePackageModule(_ name: String) -> ModuleDependency {
        ModuleDependency(name: name, package: nil)
    }
}

extension ModuleDependency: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.init(name: value, package: nil)
    }

    public typealias StringLiteralType = String
}

extension Array where Element == Module {
    var products: [Product] {
        compactMap { $0.product }
    }

    var targets: [Target] {
        flatMap { $0.targets }
    }
}
