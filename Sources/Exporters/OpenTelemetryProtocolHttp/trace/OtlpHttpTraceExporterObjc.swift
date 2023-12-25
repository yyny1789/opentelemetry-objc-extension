//
// Copyright 2023 aliyun-sls Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
	

import Foundation
import OpenTelemetrySdkObjc
import OpenTelemetryProtocolExporterHttp

public class OtlpHttpTraceExporterObjc : SpanExporterObjc {
    var otlpHttpTraceExporter: OtlpHttpTraceExporter
    
    @objc
    public init(endpoint: String, useSession: URLSession? = nil) {
        otlpHttpTraceExporter = OtlpHttpTraceExporter(
            endpoint: URL(string: endpoint)!,
            useSession: useSession
        )
        super.init(otlpHttpTraceExporter)
    }
    
    @objc
    public static func exporter(_ endpoint: String, useSession: URLSession? = nil) -> OtlpHttpTraceExporterObjc {
        return OtlpHttpTraceExporterObjc(endpoint: endpoint, useSession: useSession)
    }
    
}
