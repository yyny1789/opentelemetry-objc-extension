################################################################################################################################
##################################################### podspec file for dev #####################################################
################################################################################################################################

Pod::Spec.new do |s|
  s.name             = 'OpenTelemetrySdkObjc'
  s.version          = '1.1.0-dev.11'
  s.summary          = 'aliyun log service ios otel common library.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  log service ios producer.
  https://help.aliyun.com/document_detail/29063.html
  https://help.aliyun.com/product/28958.html
  DESC

  s.homepage         = 'https://github.com/aliyun/aliyun-log-ios-sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aliyun-log' => 'yulong.gyl@alibaba-inc.com' }
  s.source           = { :git => 'https://gitee.com/aliyun-sls/opentelemetry-objc-extension.git', :tag => s.version.to_s }
  s.social_media_url = 'http://t.cn/AiRpol8C'

  # s.ios.deployment_target = '10.0'
  # s.osx.deployment_target =  '10.12'
  # s.tvos.deployment_target =  '10.0'
  s.platform     = :ios, "10.0"

  s.requires_arc  = true
  s.libraries = 'z'
  s.swift_version = "5.0"
#  s.xcconfig = { 'GCC_ENABLE_CPP_EXCEPTIONS' => 'YES' }

#  s.ios.deployment_target = '11.0'
#  s.osx.deployment_target =  '10.13'
#  s.tvos.deployment_target =  '11.0'

  s.dependency 'OpenTelemetryApiObjc', '1.1.0-dev.11'
  s.dependency 'AliyunLogOTelCommon/OpenTelemetryApi', '4.2.1-dev.3'
  s.dependency 'AliyunLogOTelCommon/OpenTelemetrySdk', '4.2.1-dev.3'
#  s.vendored_frameworks = 'XCFramework/OpenTelemetrySdkObjc.xcframework'
  s.source_files = 'Sources/OpenTelemetrySdk/**/*.{m,h,swift}'
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 i386',
    'OTHER_LDFLAGS' => '-ObjC',
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 i386'
  }
end

