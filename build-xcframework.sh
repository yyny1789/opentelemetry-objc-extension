#!/bin/sh
set -o pipefail
set -e

rm -rf XCFramework
mkdir XCFramework

swift create-xcframework OpenTelemetryApi OpenTelemetrySdk OpenTelemetryApiObjc OpenTelemetrySdkObjc --platform ios --platform macos --platform tvos --platform maccatalyst --output ./XCFramework
