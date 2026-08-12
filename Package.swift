// swift-tools-version: 6.0

// © 2022 TomTom N.V. All rights reserved.
//
// This software is the proprietary copyright of TomTom N.V. and its subsidiaries and may be
// used for internal evaluation purposes or commercial use strictly subject to separate
// license agreement between you and TomTom N.V. If you are the licensee, you are only permitted
// to use this software in accordance with the terms of your license agreement. If you are
// not the licensee, you are not authorized to use this software in any manner and should
// immediately return or destroy it.

import PackageDescription

let sdkVersion = "0.74.0"

let package = Package(
    name: "TomTomSDKOfflineFrameworks",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [ /* products are set later */ ],
    dependencies: [
        .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-core", exact: Version(stringLiteral: sdkVersion)),
        .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-navigation", exact: Version(stringLiteral: sdkVersion)),
    ],
    targets: [ /* targets are set later */ ],
    swiftLanguageModes: [.v5]
)

let modules: [Module] = [
    Module("TomTomSDKDataManagementOffline", sha: "099ea77dd4110a66e68ebdb956e5f4c972ec1d5484a3990ed8039c794b46a09e", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardOpenLRInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKBindingNavigationTilingInternal"),
    ]),

    Module("TomTomSDKNDSStoreUpdater", sha: "941e8be99cae3af2a687be1efe78e983905b8991f21dc27640b71fcb9501c516", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardMapUpdateInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKNetworking"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKNavigationDataStoreHybrid", sha: "295bab3ccdf3875e16f0fa5a01ffa28047a92f9ec4333ca8869deae58bfbfa36", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
    ]),

    Module("TomTomSDKDataSourceSelectionEngine", sha: "76686b5c26158f766f9219cba11e7d27ff6bcf7f0294922952e63da246de1f78", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderOffline", sha: "7bdbfcf2e0e12f37ab657c97a085afb124add1ddc2e5c9243bae9899ff42f388", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingMapDisplayOnboardDataProviderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderHybrid", sha: "5b5400e509eb644a3c137fc645a5b75ff9d5eb17b4b4cbd3f45414aed79393d5", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKMapDisplayDataProviderOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKReverseGeocoderOffline", sha: "978b70bf7c3655609789da10883c997f1a42d382b2b85c9da6404dfe9dd696ae", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardReverseGeocoderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        .corePackageModule("TomTomSDKTelemetry"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardReverseGeocoderInternal", sha: "f66bb4f5837927eb07a1cc52cdd938568a0c6429e370fe5216f6e54e7fcb0ee6", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKRoutePlannerOffline", sha: "3755f0f751321ece5c5a1c66751c94ddfb064151d72393d0ce91c3bf45c7d3cf", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKTrafficEngine"),
        .navigationPackageModule("TomTomSDKBindingTrafficClientInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKTraffic"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        .corePackageModule("TomTomSDKRoutingCommon"),
        .corePackageModule("TomTomSDKTelemetry"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKRangeCalculatorOffline", sha: "4be84f852332566d2a77413a8bcedc96ecefe065aa35ebaa3a8c6904d70d0e02", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKTrafficEngine"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKTraffic"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutingCommon"),
        .corePackageModule("TomTomSDKRangeCalculator"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKSearchOffline", sha: "8d283dadbbb0f0ff106637b9b5b6bfa011342b754e43dd46a520676d2368d9e0", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKTelemetry"),
        // navigation package dependency
        .corePackageModule("TomTomSDKPersonalData"),
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKSearchOfflineCommon", sha: "dc6b9822c7c3d10edc4d1ab1c3224ed0ae21f1fe25ebe38e4050f466080557d0", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKSearchOnlineCustomData", sha: "70c3f6586d456d6802f9bfcfcd9820b7f9ae67603185f5b429800e74ec719761", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchOnline"),
        .corePackageModule("TomTomSDKPersonalData"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKTelemetry"),
    ]),

    Module("TomTomSDKBindingOnboardSearchInternal", sha: "f37c75803bf600c7361a7375a4d26f0d0d9cd1f7d3702d6609e0f46bebdd786d", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKBindingOnboardStructuredSearchInternal", sha: "f154ff51ed0c120bb5246b4f2eae876c77cbd7e606f316b32a07b4adbb9870bc", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKStyleProviderOffline", sha: "cda9930e9617dda38df69dcffc15fc4f3e9af71c536cb3a5c1843b49aefcb690", version: "0.74.0"),

    Module("TomTomSDKMapMatchingEngineOffline", sha: "959be60ebe74c98d65c239e5b518a45408b2cd5aac8ea747de339541f69ca030", version: "0.74.0", dependencies: [
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
    Module("TomTomSDKMapMatchingEngineHybrid", sha: "a3b9ba4cf10a610cbd07c053ff3587a0357ab2f6e41939c2b73c18180381623f", version: "0.74.0", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKFeatureToggle"),

        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKMapMatchingEngineTileStore"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKMapMatchingEngineUnified"),
    ]),
    Module("TomTomSDKRouteProjectionEngineOffline", sha: "77085516094e8466f303032370825a9cfe773bd8458840834c9b6b2ac302c6fa", version: "0.74.0", dependencies: [
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
    Module("TomTomSDKRouteProjectionEngineHybrid", sha: "5f6f1690bca5baf85287cfa106be3b3944fbdb75d1c6cc9cf762dc5d78c1a254", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKRouteProjectionEngineOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKBindingRouteProjectionInternal"),
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineTileStore"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineUnified"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineCommon"),
    ]),
    Module("TomTomSDKBindingNDSSQLiteInternal", sha: "bd07f128c391ca7f669f05911fdbb1e389687d52d933ef630975128c19a3673d", version: "0.74.0"),
    Module("TomTomSDKBindingNDSStoreAccessInternal", sha: "1e18353d3db6c76859e839eed492111ec3d45f9a1005afe5c0ac3fb07cfbc33b", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingOnboardMapUpdateInternal", sha: "24cc66c0f2bfc4511bd1cfe3a4b45b56fb9aa9e4c5353fec84d53ec5add7e481", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingMapDisplayOnboardDataProviderInternal", sha: "7d69319f3685a3d66697a4e310852fe7be428e4649be11d8ae4c9afe15e8ea2e", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKTrafficEngine", sha: "dc626fb8519fbf56f39e4fd151f4ef3950bfe6bf69205e89c0ad7865c34b3b28", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingTrafficLegacyInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKTraffic"),
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        .corePackageModule("TomTomSDKNetworking"),
        .corePackageModule("TomTomSDKTelemetry"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKBindingTrafficClientInternal"),
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
        .navigationPackageModule("TomTomSDKHorizonEngineCommon"),
        .navigationPackageModule("TomTomSDKTrafficInternal"),
    ]),
    Module("TomTomSDKBindingTrafficLegacyInternal", sha: "be8c365fc43068a87f39cdde76c5cdbc58752760a3e9246e16feb9de0277e7ee", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKReverseGeocoderHybrid", sha: "f1853d63d7c45f8c2b619e6edac43f8975e491bb523730bbcc3327395e0987d1", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKReverseGeocoderOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        .corePackageModule("TomTomSDKReverseGeocoderOnline"),
    ]),
    Module("TomTomSDKRoutePlannerHybrid", sha: "00d6342e8795526c443294c5298adb94db057371d9945a0d630330f0cb4f829a", version: "0.74.0", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        .corePackageModule("TomTomSDKRoutingCommon"),
    ]),
    Module("TomTomSDKRouteReplannerHybrid", sha: "8094eb25667748af2096cc6a102996874e1b93c098fcad21d5b17f3865a5b58f", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKRoutePlannerHybrid"),
        .offlinePackageModule("TomTomSDKRoutePlannerOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutingCommon"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        .corePackageModule("TomTomSDKRoutePlannerOnline"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKRouteReplanner"),
        .navigationPackageModule("TomTomSDKRouteReplannerInternal"),
    ]),
    Module("TomTomSDKBindingOnboardDirectionsInternal", sha: "9f8d973709a938ccd406fc4a849a5fe7bb10eb0c94935d85db77af17ad30e1f5", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
        .navigationPackageModule("TomTomSDKBindingTrafficClientInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoutingCommon"),
    ]),
    Module("TomTomSDKSearchHybrid", sha: "13f247653b7aa14b0bf2e879a3707b0d173f89e957c23ae74505ac7c6d226b2e", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKSearchOffline"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependency
        .corePackageModule("TomTomSDKPersonalData"),
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKSearchOnline"),
        .corePackageModule("TomTomSDKTelemetry"),
    ]),
    Module("TomTomSDKStructuredSearch", sha: "d9a3758857ff4e6e003ef804ffbd1c618b708819d5d9d4c08214556ac8e39141", version: "0.74.0", dependencies: [
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKStructuredSearchOffline", sha: "c821461bee68669451070a13d89859d55e673614610d1fd4d8a8942c1bdfa4d2", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardStructuredSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKStructuredSearch"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardOpenLRInternal", sha: "87e059b14ea1c95640d8560276c92781d0a47e92d59afe5bce701c40717f734a", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingVehicleHorizonNDSMapInternal", sha: "1dcff68ba6602d97fc98e39ac731a5741b005009baf92e0da2c71344e6793aeb", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKHorizonEngineOffline", sha: "9ab1520ff09e8ee3b67c8ddfafedcdf948eb35ed8f1ccab313fac68d02388d46", version: "0.74.0", dependencies: [
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
        .navigationPackageModule("TomTomSDKBindingUnifiedOpenLRInternal"),
        .navigationPackageModule("TomTomSDKUnifiedLocationDecoder"),
        .navigationPackageModule("TomTomSDKHazards"),
        .navigationPackageModule("TomTomSDKHazardsDataAdapterOnline"),
        .navigationPackageModule("TomTomSDKSafetyCameras"),
        .navigationPackageModule("TomTomSDKSafetyLocationsDataAdapterOnline"),
    ]),
    Module("TomTomSDKHorizonEngineHybrid", sha: "11516555db030b6590ab1760904dc0fb843db357f674f5b1dbca7015fdb16fb7", version: "0.74.0", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKFeatureToggle"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        .offlinePackageModule("TomTomSDKHorizonEngineOffline"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
        .navigationPackageModule("TomTomSDKNavigationHorizonDataAdapter"),
        .navigationPackageModule("TomTomSDKHorizonEngineCommon"),
        .navigationPackageModule("TomTomSDKHorizonEngineTileStore"),
        .navigationPackageModule("TomTomSDKHorizonEngineUnified"),
        .navigationPackageModule("TomTomSDKHazards"),
        .navigationPackageModule("TomTomSDKHazardsDataAdapterOnline"),
        .navigationPackageModule("TomTomSDKSafetyCameras"),
        .navigationPackageModule("TomTomSDKSafetyLocationsDataAdapterOnline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKNavigationOffline", sha: "73a1bf1e0d839acb212462cb84cb578289c75fce7f73d8def0cd9dbee0bb839b", version: "0.74.0", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKHorizonEngineOffline"),
        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKRouteProjectionEngineOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKVehicle"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigation"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKDataStoreMaintenanceEngine"),
        .navigationPackageModule("TomTomSDKRouteReplanner"),
        .navigationPackageModule("TomTomSDKRouteReplannerDefault"),
        .navigationPackageModule("TomTomSDKHazards"),
        .navigationPackageModule("TomTomSDKSafetyCameras"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineCommon"),
        .navigationPackageModule("TomTomSDKHorizonEngineUnified"),
        .navigationPackageModule("TomTomSDKMapMatchingEngineUnified"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineUnified"),
        .navigationPackageModule("TomTomSDKNavigationHorizonDataAdapter"),
    ]),
    Module("TomTomSDKNavigationHybrid", sha: "fa7dd5ab1d0fb98b154c9c93f35a774246a97d0eb995546347d92f56a818f0d9", version: "0.74.0", dependencies: [
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
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKVehicle"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        .corePackageModule("TomTomSDKRoutePlannerOnline"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigation"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKDataStoreMaintenanceEngine"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
        .navigationPackageModule("TomTomSDKRouteReplanner"),
        .navigationPackageModule("TomTomSDKHazards"),
        .navigationPackageModule("TomTomSDKSafetyCameras"),
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

    static func thirdpartyPackageModule(_ name: String, package: String) -> ModuleDependency {
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

    typealias StringLiteralType = String
}

extension Array where Element == Module {
    var products: [Product] {
        compactMap { $0.product }
    }

    var targets: [Target] {
        flatMap { $0.targets }
    }
}
