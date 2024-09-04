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

let sdkVersion = "0.60.1"

let package = Package(
    name: "TomTomSDKOfflineFrameworks",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [ /* products are set later */ ],
    dependencies: [
        .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-core", exact: Version(stringLiteral: sdkVersion)),
        .package(url: "https://github.com/tomtom-international/tomtom-sdk-spm-navigation", exact: Version(stringLiteral: sdkVersion)),
    ],
    targets: [ /* targets are set later */ ],
    swiftLanguageVersions: [.v5]
)

let modules: [Module] = [
    Module("TomTomSDKDataManagementOffline", sha: "206489873a4033b7964f91e2e3464c3c11d7cdba47910603eceec594750c3b2a", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardOpenLRInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKBindingNavigationTilingInternal"),
    ]),

    Module("TomTomSDKNDSStoreUpdater", sha: "5ca18d8ac860eb62ee9ab3117102efdd525a3a671ab30f0ddc96bb2ba3aa9a19", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardMapUpdateInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKNetworking"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKNavigationDataStoreHybrid", sha: "2ddfd319d42841466ca64b7395bc57d66fca24b6333cf7cfd2029b3d14c3579c", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
    ]),

    Module("TomTomSDKDataSourceSelectionEngine", sha: "0e3fe52259677005e18bf68de25bfbf77c43fd04ef8a8817484877d5e16f6b53", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderOffline", sha: "40fe00e0a7d409b1408478b2b854e64670f39298f1ce270f2909ae780a09fc37", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingMapDisplayOnboardDataProviderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderHybrid", sha: "8c59545a7229af900497e8c8ffa70e70bc6474cf85c2a2676eef125e8df9dc6a", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKMapDisplayDataProviderOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKReverseGeocoderOffline", sha: "e256b8a8b3c1147fd7881e0e080a47229f5df1019c2c94b428747f3be527e20a", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardReverseGeocoderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardReverseGeocoderInternal", sha: "90569aa35e50add8786efb1bccab0edbf0bd201153b80a7a632463227c697575", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKRoutePlannerOffline", sha: "91f55a4f9cd6a7bb03716daee2b0f3803cd098a488042f11bd391f5095666aec", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKTrafficEngine"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKTraffic"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        .corePackageModule("TomTomSDKRoutingCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKRangeCalculatorOffline", sha: "25a52342473727dc8b76c469df4c94847dd4f4e6c81599af79ade8c5e896da15", version: "0.60.1", dependencies: [
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

    Module("TomTomSDKSearchOffline", sha: "dcab2d4cd003711b0078d4361f11d9c01689c0b69b348e27adea52cf01943dd1", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        // navigation package dependency
        .corePackageModule("TomTomSDKPersonalData"),
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKSearchOfflineCommon", sha: "5793ec464298313e0e75d8d8a4982a6ec55e81871dd8e8d4136de16e823f2111", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKSearchOnlineCustomData", sha: "e47b02f9b607331d0b57d0e360acd7770d1b210c0564b49b93d93fe59cccdc93", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchOnline"),
        .corePackageModule("TomTomSDKPersonalData"),
        .corePackageModule("TomTomSDKSearchCommon"),
    ]),

    Module("TomTomSDKBindingOnboardSearchInternal", sha: "643d72a640ae95050d08963c07f2a8f9e12650ecfe846ebf8fda08ecda4c1c4e", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKBindingOnboardStructuredSearchInternal", sha: "60685643f26dafa6136ef78361d772c0519f7f7058cde6b3137305bff0dbb143", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKStyleProviderOffline", sha: "fbc247fced9566e767554f81ee36986869d67bbdf765fbcaa5cac9190624b44b", version: "0.60.1"),

    Module("TomTomSDKMapMatchingEngineOffline", sha: "6cf5a621b7623ce51988f1127e0ff4f92163b7e0232f3fc86ca9012f631d5a4c", version: "0.60.1", dependencies: [
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
    Module("TomTomSDKMapMatchingEngineHybrid", sha: "d2ac8a9381ff54e353bbf44a797584926c2833f09dbe21f85d4d1e67c51a3a57", version: "0.60.1", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKFeatureToggle"),

        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKMapMatchingEngineTileStore"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKMapMatchingEngineUnified"),
    ]),
    Module("TomTomSDKRouteProjectionEngineOffline", sha: "9fd8237fbc2c37c440ba32d731c1218cf5b8a782ff9645156a00dadf2efb5702", version: "0.60.1", dependencies: [
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
    Module("TomTomSDKRouteProjectionEngineHybrid", sha: "1817e5491e6f2bd1586a03c7b4539cd1510c5524c9f8fbeb94612e56d4cf7059", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKRouteProjectionEngineOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependency
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
    Module("TomTomSDKBindingNDSSQLiteInternal", sha: "2e73fd2151d3c10affc02fcd76b24dee64c91bca9fc8b8d1e262d9af61bf3864", version: "0.60.1"),
    Module("TomTomSDKBindingNDSStoreAccessInternal", sha: "6430dea94c31f0a9cd1abeb945c6c23a5f2929807f3d7fcb78e15501ba8a7d8d", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingOnboardMapUpdateInternal", sha: "e8a5f3e81e1b8a4f593e2cd138994e07279b2186a54c5b60e55000d72feae995", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingMapDisplayOnboardDataProviderInternal", sha: "adcb1e4f4390dc306ede9761628ef6c491c41c1b13b957d9c380a955b5a288ac", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
    ]),
    Module("TomTomSDKTrafficEngine", sha: "3a69b096bfeb14a3a42bf09f1bfcb142214cd903e6acf96c037bc9602ca96faa", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingTrafficInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKTraffic"),
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKNetworking"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingTrafficInternal", sha: "3ae24de30c6dc17b9afadf8e650c7e409376d93156d5109d8b16f4404d13bc9c", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKReverseGeocoderHybrid", sha: "96782c6c3865f14198049c24f141baf496b94ce2c0f067ad9f3e771c30c98d3b", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKReverseGeocoderOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        .corePackageModule("TomTomSDKReverseGeocoderOnline"),
    ]),
    Module("TomTomSDKRoutePlannerHybrid", sha: "8e61b6d2ab10438ab5c213928f17ec0bc06e45b509af5638b88ea1b399680296", version: "0.60.1", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
    ]),
    Module("TomTomSDKRouteReplannerHybrid", sha: "60ce140f68ffe3c941f7ced1a45d9e5777592fba182a956a2011930d1f5963f4", version: "0.60.1", dependencies: [
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
    Module("TomTomSDKBindingOnboardDirectionsInternal", sha: "bd6fcb496203012b2e8eabb7e822892098e0ea0c7559bfc2cc2e35b053dc50f2", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoutingCommon"),
    ]),
    Module("TomTomSDKSearchHybrid", sha: "0be0589e5eb3e64cbf33a02f949fb6745c5216fa4f2394a02f01f185e919c3ec", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKSearchOffline"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependency
        .corePackageModule("TomTomSDKPersonalData"),
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKSearchOnline"),
    ]),
    Module("TomTomSDKStructuredSearch", sha: "41b7da7c8f6786117e79e606b7de00c2f9a1f0101890970b8dcd0b99c2c7ff03", version: "0.60.1", dependencies: [
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKStructuredSearchOffline", sha: "34570abae23bc9824a26622c96367891c16ce6270059e3091719c9f0099d5255", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardStructuredSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKStructuredSearch"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardOpenLRInternal", sha: "00fda686d2137bf4a6db0f4309e5bbbb674fa21f263202e139b6fe46d9227619", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingVehicleHorizonNDSMapInternal", sha: "d963c87b3b8eb72f0e9d4ebacf17bdb3f82e4b7764443e065e836affc5f20da5", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKHorizonEngineOffline", sha: "73c14996525d37fc62931b1f0bf209c30f32037e4157955f505465126cd887ac", version: "0.60.1", dependencies: [
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
    Module("TomTomSDKHorizonEngineHybrid", sha: "ae6d8b5e2cf2aec6b8a6cae0869224b793cca5375909558bfe0602e0901801c7", version: "0.60.1", dependencies: [
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
    Module("TomTomSDKNavigationOffline", sha: "debfbae3e81a5321be6646b0283ec9ba22c4c50239b6ba8113fcfe952a21c034", version: "0.60.1", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKHorizonEngineOffline"),
        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKRouteProjectionEngineOffline"),
        // core package dependencies
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
        .navigationPackageModule("TomTomSDKHorizonEngineUnified"),
        .navigationPackageModule("TomTomSDKMapMatchingEngineUnified"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineUnified"),
    ]),
    Module("TomTomSDKNavigationHybrid", sha: "9cd387b8ca1351a7051556554c2e9c7fc7bff2153ba6ca23d5ef310c7d9398ec", version: "0.60.1", dependencies: [
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
