// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "opentelemetry-objc-extension",
//    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "OpenTelemetrySdkObjc",
            type: .static,
            targets: ["OpenTelemetrySdkObjc"]
        ),
        .library(
            name: "OpenTelemetryApiObjc",
            type: .static,
            targets: ["OpenTelemetryApiObjc"]
        ),
        .library(
            name: "URLSessionInstrumentationObjc",
            type: .static,
            targets: ["URLSessionInstrumentationObjc"]
        ),
        .library(
            name: "OpenTelemetryProtocolExporterCommonObjc",
            type: .static,
            targets: ["OpenTelemetryProtocolExporterCommonObjc"]
        ),
        .library(
            name: "OpenTelemetryProtocolExporterObjc",
            type: .static,
            targets: [
                "OpenTelemetryProtocolExporterObjc"
            ]
        ),
        .library(
            name: "OpenTelemetryProtocolExporterHTTPObjc",
            type: .static,
            targets: ["OpenTelemetryProtocolExporterHTTPObjc"]
        ),
        .library(
            name: "StdoutExporterObjc",
            type: .static,
            targets: ["StdoutExporterObjc"]
        ),
        .library(
            name: "ResourceExtensionObjc",
            type: .static,
            targets: ["ResourceExtensionObjc"]
        ),
        .executable(
            name: "OTelSample",
            targets: ["OTelSample"]
        )
    ],
    dependencies: [
        .package(url:"https://github.com/open-telemetry/opentelemetry-swift", from: "1.9.1"),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "OpenTelemetryApiObjc",
            dependencies: [
                .product(name: "OpenTelemetryApi", package: "opentelemetry-swift")
            ],
            path: "Sources/",
            sources: ["OpenTelemetryApi/"]
        ),
        .target(
            name: "OpenTelemetrySdkObjc",
            dependencies: [
                .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift"),
                .target(name: "OpenTelemetryApiObjc")
            ],
            path: "Sources/",
            sources: ["OpenTelemetrySdk/"]
        ),
        .target(
            name: "OpenTelemetryProtocolExporterCommonObjc",
            dependencies: [
                .product(name: "OpenTelemetryProtocolExporter", package: "opentelemetry-swift")
            ],
            path: "Sources/Exporters/OpenTelemetryProtocolCommon"
        ),
        .target(
            name: "OpenTelemetryProtocolExporterHTTPObjc",
            dependencies: [
                .byName(name: "OpenTelemetrySdkObjc"),
                .product(name: "OpenTelemetryProtocolExporterHTTP", package: "opentelemetry-swift")
            ],
            path: "Sources/Exporters/OpenTelemetryProtocolHttp"
            
        ),
        .target(
            name: "OpenTelemetryProtocolExporterObjc",
            dependencies: [
                .byName(name: "OpenTelemetrySdkObjc"),
                .byName(name: "OpenTelemetryProtocolExporterCommonObjc"),
                .product(name: "OpenTelemetryProtocolExporter", package: "opentelemetry-swift"),
                .product(name: "GRPC", package: "grpc-swift")
            ],
            path: "Sources/Exporters/OpenTelemetryProtocolGrpc"
        ),
        .target(
            name: "StdoutExporterObjc",
            dependencies: [
                .byName(name: "OpenTelemetrySdkObjc"),
                .product(name: "StdoutExporter", package: "opentelemetry-swift")
            ],
            path: "Sources/Exporters/Stdout"
        ),
        .target(
            name: "URLSessionInstrumentationObjc",
            dependencies: [
                .product(name: "URLSessionInstrumentation", package: "opentelemetry-swift")
            ],
            path: "Sources/Instrumentation/URLSession"
        ),
        .target(
            name: "ResourceExtensionObjc",
            dependencies: [
                .byName(name: "OpenTelemetrySdkObjc"),
                .product(name: "ResourceExtension", package: "opentelemetry-swift")
            ],
            path: "Sources/Instrumentation/SDKResourceExtension"
        ),
        .target(
            name: "OTelSample",
            dependencies: [
                .product(name: "OpenTelemetryApi", package:"opentelemetry-swift"),
                .product(name: "OpenTelemetrySdk", package:"opentelemetry-swift"),
                .product(name: "OpenTelemetryProtocolExporter", package:"opentelemetry-swift"),
                .product(name: "StdoutExporter", package:"opentelemetry-swift"),
                .product(name: "URLSessionInstrumentation", package:"opentelemetry-swift")
                
            ],
            path: "Examples/OTelSample/"
        ),
        .testTarget(
            name: "OpenTelemetryApiTest",
            dependencies: ["OpenTelemetryApiObjc"],
            path: "Tests/OpenTelemetryApiTest"
        ),
    ]
)
