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

let sdkVersion = "0.47.6"

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
    Module("TomTomSDKDataManagementOffline", sha: "5e382d16746d0fc6358160d015586a32f3105e54e1e7fa14735bc2c733d19c1e", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardDirectionsInternal"),
        .offlinePackageModule("TomTomSDKBindingOnboardOpenLRInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKBindingNavigationTilingInternal"),
    ]),

    Module("TomTomSDKNDSStoreUpdater", sha: "041abbab58ad44384fc1a04a5bececa391c61bccdc8580d20b3b58853de9b065", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardMapUpdateInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKNetworking"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKNavigationDataStoreHybrid", sha: "9f78a21a3d4454cb84667892589faef7534ad4a2cd89485e359adcd8d5a74df7", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationTileStore"),
    ]),

    Module("TomTomSDKDataSourceSelectionEngine", sha: "85b1115beea014d78f69204dbcaffb654ff769358da6bd425d0a416652e97d39", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderOffline", sha: "db111efde35e9bee467556ae175f7e349a1aa03d0cfd55e557382b2675651a22", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingMapDisplayOnboardDataProviderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        // navigation package dependencies
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKMapDisplayDataProviderHybrid", sha: "463e1b735416692564fd2fb68f2846587a216eb2a74443415acb306128a81b02", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKMapDisplayDataProviderOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKMapDisplay"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),

    Module("TomTomSDKReverseGeocoderOffline", sha: "082ae362f00e8fbb7e36d29eec8ce8a5e70dd0dfd96c95c6d134336812f51b5a", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardReverseGeocoderInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardReverseGeocoderInternal", sha: "e4d9c95bc8fd9ed90dcadbe7314dc784b3b4a9468614ccf1a2844d6d1c90a190", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKRoutePlannerOffline", sha: "04cffaa847cd0530aaaf5fbdb40c3ea15e638763ef17aece10f40ac8eb0916b3", version: "0.47.6", dependencies: [
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

    Module("TomTomSDKRangeCalculatorOffline", sha: "049823d8cd86543a55037b6f0adc57fc6113b7f4ecc694f6c50a8eabb6b0ff46", version: "0.47.6", dependencies: [
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

    Module("TomTomSDKPersonalDataOffline", sha: "9cc69af112de14620efa33a77f102457b7ebb27230923a818dfeefc5f03a0553", version: "0.47.6", dependencies: [
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKSearchOffline", sha: "b64affba34faabee2bf63f341cb0f13e62ff5858171fd7906e97b98ee759c64f", version: "0.47.6", dependencies: [
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

    Module("TomTomSDKSearchOfflineCommon", sha: "78b9628dd3edac15a5f5657b76e538be52dc25e4cad1e2faf11805b14a25ef93", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchCommon"),
        .corePackageModule("TomTomSDKPersonalData"),
    ]),

    Module("TomTomSDKSearchOnlineCustomData", sha: "7123a8aa078a55dec3fcf0917f982f2ccf90e77cc2c874f3408e640a9595669b", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardSearchInternal"),
        .offlinePackageModule("TomTomSDKSearchOfflineCommon"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKSearch"),
        .corePackageModule("TomTomSDKSearchOnline"),
        .corePackageModule("TomTomSDKPersonalData"),
        .corePackageModule("TomTomSDKSearchCommon"),
    ]),

    Module("TomTomSDKBindingOnboardSearchInternal", sha: "6bdd2bf6499bb59e16c72c369726ea4a48fc4415e92d46894d6a05cd211c14d7", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKBindingOnboardStructuredSearchInternal", sha: "8322e876fd20381b62eecb91f97aa39a81c63c6723002ae590d356ede12fc9cc", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),

    Module("TomTomSDKStyleProviderOffline", sha: "f7930a12ea98dc4fe2cf9710078da3fd193cf3d6c879cf907718a6dba743d532", version: "0.47.6"),

    Module("TomTomSDKMapMatchingEngineOffline", sha: "2775997a413c47ab919471b835b86b05d154c1c323a20005d66214d161dd83fa", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKMapMatchingEngineHybrid", sha: "52552b0a028a0f0cb26dcd2ed172ccd7188ee7bade0567f1294681070499743b", version: "0.47.6", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKFeatureToggle"),

        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKNavigationDataStoreHybrid"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKMapMatchingEngineTileStore"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKMapMatchingEngineUnified"),
    ]),
    Module("TomTomSDKRouteProjectionEngineOffline", sha: "b20b6aaae904124dca3a76d1b521c1b3e6d27e49e113c090269df7bbb1576522", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKRouteProjectionEngineHybrid", sha: "0af4358de9b9e471fd3ec970ab67edd8f17f567ad7a404c9facc20972b2ee995", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKBindingNDSSQLiteInternal", sha: "a403b10a70886b1d798a167c4c4e45583ed20e1929f1df20cc25733e549f32c4", version: "0.47.6"),
    Module("TomTomSDKBindingNDSStoreAccessInternal", sha: "b2ea0807b606afbd99f6769db0b9e7037532de4ff5fb44434072227851a20b17", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingOnboardMapUpdateInternal", sha: "f4b6060747f8e1c76a003a4cb6c790e98234f5c6d571be88334f4a15fd5bc019", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingMapDisplayOnboardDataProviderInternal", sha: "1b6b0a073806a9217202f8e823bd172e3fd8a1af8a4f9df65dcbec4be7c317cb", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
    ]),
    Module("TomTomSDKTrafficEngine", sha: "033475e7b6a75144bfd78ddb6b92a25518f08bb724b4671fd2d20644d6e8b1be", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKBindingTrafficInternal", sha: "822976a65ecc197a2b23cab45d6882359c959240464e1e922d711527f4f4e301", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKReverseGeocoderHybrid", sha: "8bc28da58f43bedf1eaeec8856ffa7392033889fbd87d5fe4c5a69ac385a38b2", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKReverseGeocoderOffline"),
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKReverseGeocoder"),
        .corePackageModule("TomTomSDKReverseGeocoderOnline"),
    ]),
    Module("TomTomSDKRoutePlannerHybrid", sha: "46f02a0bcfbb2de53b519ecf0d4ec1a8c10b2cd7922835632818a77fdd4b496b", version: "0.47.6", dependencies: [
        // core package dependency
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoute"),
        .corePackageModule("TomTomSDKRoutePlanner"),
    ]),
    Module("TomTomSDKRouteReplannerHybrid", sha: "9a60d2c16d2fb308b8fc6f98dc5a8a0965c4c90d8e95b27cb52a3ad3b42f130a", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKBindingOnboardDirectionsInternal", sha: "12f4d0d5d93647b3a119c7be1b503f43836519f1510b26cb2c0835ada5f1ff4e", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        .corePackageModule("TomTomSDKRoutingCommon"),
    ]),
    Module("TomTomSDKSearchHybrid", sha: "268e4ec351afdeb3b2fcc66008d09b06d89feefacdd8d92736c456ae60c9b8d7", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKStructuredSearch", sha: "22a8dcdf02bc904c0e22e3b89123348ad5545f3554b71263938f20960cde8f4c", version: "0.47.6", dependencies: [
        .corePackageModule("TomTomSDKCommon"),
    ]),
    Module("TomTomSDKStructuredSearchOffline", sha: "7a032db40d388b346f06865c5b939ebfd6c812c9d68857b64fc5de233eeb9663", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingOnboardStructuredSearchInternal"),
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKStructuredSearch"),
        // core package dependencies
        .corePackageModule("TomTomSDKCommon"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKDataManagement"),
    ]),
    Module("TomTomSDKBindingOnboardOpenLRInternal", sha: "c88f3a20ffd171faf1f06d45b9b77a448fc64754dbff691d3de318b4eb9c8557", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKBindingVehicleHorizonNDSMapInternal", sha: "c62a3a37b79c51b3e66f78eeb286afcc2ff6dc13c373fca57a762c7801b4d70f", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKBindingNDSStoreAccessInternal"),
        .offlinePackageModule("TomTomSDKBindingNDSSQLiteInternal"),
    ]),
    Module("TomTomSDKHorizonEngineOffline", sha: "7606632935e09fcaf22b02d1aaab82f7d57eaebdb714dbbd45a87cb65ed98cc6", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKHorizonEngineHybrid", sha: "b60666c9669820268790a5f7cc19207b180197858a38132ef1309b672d5bf5a1", version: "0.47.6", dependencies: [
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
    Module("TomTomSDKNavigationOffline", sha: "79fb4c35efbda617d49d6d3a749468fade8ff7173f8a66f8f92223a169be6617", version: "0.47.6", dependencies: [
        .offlinePackageModule("TomTomSDKDataManagementOffline"),
        .offlinePackageModule("TomTomSDKHorizonEngineOffline"),
        .offlinePackageModule("TomTomSDKMapMatchingEngineOffline"),
        .offlinePackageModule("TomTomSDKRouteProjectionEngineOffline"),
        // core package dependencies
        .corePackageModule("TomTomSDKLocationProvider"),
        .corePackageModule("TomTomSDKVehicle"),
        .corePackageModule("TomTomSDKFeatureToggle"),
        // navigation package dependency
        .navigationPackageModule("TomTomSDKNavigation"),
        .navigationPackageModule("TomTomSDKNavigationEngines"),
        .navigationPackageModule("TomTomSDKDataStoreMaintenanceEngine"),
        .navigationPackageModule("TomTomSDKRouteReplanner"),
        .navigationPackageModule("TomTomSDKHazards"),
        .navigationPackageModule("TomTomSDKSafetyCameras"),
        .navigationPackageModule("TomTomSDKHorizonEngineUnified"),
        .navigationPackageModule("TomTomSDKMapMatchingEngineUnified"),
        .navigationPackageModule("TomTomSDKRouteProjectionEngineUnified"),
    ]),
    Module("TomTomSDKNavigationHybrid", sha: "7b90bb5f4f4c6f0d50e034d35f923cce08c2cedf707a9d87d668aa9b3e567428", version: "0.47.6", dependencies: [
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
