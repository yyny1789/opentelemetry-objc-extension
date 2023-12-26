#!/bin/sh
set -o pipefail
set -e

rm -rf XCFramework
mkdir XCFramework

swift create-xcframework OpenTelemetryApiObjc OpenTelemetrySdkObjc --platform ios --platform macos --platform tvos --platform maccatalyst --output ./XCFramework
