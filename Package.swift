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

let sdkVersion = "0.74.2"

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
    Module("TomTomSDKDataManagementOffline", sha: "4470fe7b0e7f18f99a80c1b10c4f4f536d2a86ae42b5f48d250a4d87cd21e027", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardOpenLRInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKBindingNavigationTilingInternal"),
    ]),

    Module("TomTomSDKNDSStoreUpdater", sha: "281d5223f42355bd10170af88ccf18c940e3d982a566a81bee8211c6fbf83cb9", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardMapUpdateInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKNetworking"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKNavigationDataStoreHybrid", sha: "224615d71fba330e044b512391f566f408c4f1e5a10607a7608aa9ff313b5afc", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
    ]),

    Module("TomTomSDKDataSourceSelectionEngine", sha: "c23e3273f7166398e36caf66f29c7decee030aff872fa8c800535b1c369409ed", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderOffline", sha: "07562962a8870e8b070e3103462c29a7e50c7d0bf1b0e6acbf5bbf6d66dfaa42", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingMapDisplayOnboardDataProviderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderHybrid", sha: "dc7066234325bb3c122ef9961e0b9ac1f1a3acc06c5a3c2bcf37feed267b4f1d", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKMapDisplayDataProviderOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKReverseGeocoderOffline", sha: "fd413b2a84e911631b60ead2744cc8a3fbfcc60ee3a111f9c2bf0635043ac911", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardReverseGeocoderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        .corePackageModule("TomTomSDKTelemetry"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardReverseGeocoderInternal", sha: "811389fa0a81668d2ad34c3a65c2b8f7a0442f71fd9489a06e91dc2451a1b1bd", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKRoutePlannerOffline", sha: "4cebb73e8606947a083c0df07a41e2684e615376dcfc123fb64c1a7f61e8ed6f", version: "0.74.2", dependencies: [
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

    Module("TomTomSDKRangeCalculatorOffline", sha: "5057b3fe930084eff5d5420769e0639a3e52650f4a97e6d4f71b5da657496070", version: "0.74.2", dependencies: [
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

    Module("TomTomSDKSearchOffline", sha: "cdff516b5e816dd6bae66908a92b93f9f546359a1f148410771903ae23785568", version: "0.74.2", dependencies: [
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

    Module("TomTomSDKSearchOfflineCommon", sha: "1b1191fae2fcf92c8f4fc55266a8f134a98e7a342b2c14ad4f22fede462baa87", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKSearchOnlineCustomData", sha: "648a08685381f83af1bd1346f457003e7ebd53304f5cdd6c3979099854892f6c", version: "0.74.2", dependencies: [
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

    Module("TomTomSDKBindingOnboardSearchInternal", sha: "a9275345ab3ba3c84264d49e24af00f757d4c3fe596a0f2cf7de5817109cddc2", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKBindingOnboardStructuredSearchInternal", sha: "833b55f89051792281dcaf240bc1638d1b9921b0b6b039e72611bf55f183c03f", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKStyleProviderOffline", sha: "7474db94556f019aa31ece90597205ce452e600f42a17640ceaa815d8fdbabc3", version: "0.74.2"),

    Module("TomTomSDKMapMatchingEngineOffline", sha: "acfdc95680fe4e3fba9ce2bd25df612a2cfd9b95f240756491671af2cea7b6ce", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKMapMatchingEngineHybrid", sha: "6c13af0e780897f1a4f596a9f87a49ebebae908062cdba95da6448a6d921cda5", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKRouteProjectionEngineOffline", sha: "5bee78b024dc98c7040866d92bbd3a82a6d2044abf53bc7f05153e04dbcb3453", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKRouteProjectionEngineHybrid", sha: "f042037133168462174683cfa996155cd3e57b59d75dba18ca50628ed1a0a823", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKBindingNDSSQLiteInternal", sha: "411b82232f735d2bf33e58e44f827c83df631fb3fbfa7cc75c2da493cfc23a66", version: "0.74.2"),
    Module("TomTomSDKBindingNDSStoreAccessInternal", sha: "cd35da838d51c3d0b74ca5db632352a487b9bd353603de90cd60cbad4f0a000c", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingOnboardMapUpdateInternal", sha: "d68cfa03a1db204f478cc3c44754a1fd065b5c58ef6b24705f345f4d1c05425a", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingMapDisplayOnboardDataProviderInternal", sha: "d348c4483ff7a9eb850bd3f4d9c3c21b491fa35ada11ec6abc0d9c4c5c114a93", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKTrafficEngine", sha: "20f23bd32a9b8d4df7c72be0101c98abfeded5e3c0122f04acc036e9e8d137fa", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKBindingTrafficLegacyInternal", sha: "fd82b7ec332a62bce44c13b56fb5734a598f048b5a2f7df24c823d0426e9d500", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKReverseGeocoderHybrid", sha: "39785be144257c34739d8c3f66766c3268ccd0fea426e5566ab09d41268b304f", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKReverseGeocoderOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        .corePackageModule("TomTomSDKReverseGeocoderOnline"),
    ]),
    Module("TomTomSDKRoutePlannerHybrid", sha: "2b9ad44b6af52aea37b980110e75d7380a0f087414be3e6a9f2c226608c384ef", version: "0.74.2", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
        .corePackageModule("TomTomSDKRoutingCommon"),
    ]),
    Module("TomTomSDKRouteReplannerHybrid", sha: "e725b4f9237971f4556ca6b76999cb5e86402d0d3d265b3ee9f7802bcd3fc318", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKBindingOnboardDirectionsInternal", sha: "27f3a3537d3f4cbc40507c2ccece9fd8fdbbf00140e055d3700066f4cca31aaf", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
        .navigationPackageModule("TomTomSDKBindingTrafficClientInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoutingCommon"),
    ]),
    Module("TomTomSDKSearchHybrid", sha: "95c64fffb7555817a698aa3f54ebb139dfefa755f18ceb673a5b4862f8a25c8e", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKStructuredSearch", sha: "ea55895abc62fb73fb0f9971e44f180776aa9b39b78e627f0b0f9c95d6b4eb91", version: "0.74.2", dependencies: [
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKStructuredSearchOffline", sha: "dbbfd8f6618901bb2b06f42ff909b577119e08ee6ebf8b713133b09d158e76ef", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardStructuredSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKStructuredSearch"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardOpenLRInternal", sha: "a06d3bca3b7ffa3e44ae380e4dec9d4159ba383fbec3fc4e5553fa18a5c35832", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingVehicleHorizonNDSMapInternal", sha: "8dc20adccbfe5b75756091903d376327d64bdc06860de82b27bf4400617ba140", version: "0.74.2", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKHorizonEngineOffline", sha: "d89f1c6b51a29baed05011ca0e379d2b9ead628f6cc2d409cfe363115e5d8330", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKHorizonEngineHybrid", sha: "84f02f662f3acd4a9882abb566fc5fee4fa34026cf6a63d5486f467ccda2dc20", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKNavigationOffline", sha: "d3f591aa7fcb760284102b57c735e5a06584a34b43ea831bf7d1846a8258089a", version: "0.74.2", dependencies: [
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
    Module("TomTomSDKNavigationHybrid", sha: "2c26fc5d9249a8de625aab37735bba240b5454c5588b8ae4a210dd594af94ba4", version: "0.74.2", dependencies: [
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
