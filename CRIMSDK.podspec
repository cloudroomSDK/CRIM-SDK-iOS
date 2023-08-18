#
# Be sure to run `pod lib lint CRIMSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CRIMSDK'
  s.version          = '1.0.3'
  s.summary          = 'CRIM-SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  CRIMSDK：iOS版本IM SDK 可以轻松替代第三方IM云服务，打造具备聊天、社交功能的app。
                       DESC

  s.homepage         = 'https://github.com/cloudroomSDK/CRIM-SDK-iOS.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CRIM' => 'https://github.com/cloudroomSDK/CRIM-SDK-iOS.git' }
  s.source           = { :git => 'https://github.com/cloudroomSDK/CRIM-SDK-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  
  s.public_header_files = 'CRIMSDK/CRIMSDK.h'
  s.source_files = 'CRIMSDK/CRIMSDK.h'


  s.subspec 'Utils' do |ss|
    ss.source_files = 'CRIMSDK/Utils/*.{h,m}'
  end

  s.subspec 'CallbackProxy' do |ss|
    ss.dependency 'CRIMSDK/Utils'

    ss.source_files = 'CRIMSDK/CallbackProxy/*.{h,m}'
  end

  s.subspec 'Model' do |ss|
    ss.dependency 'CRIMSDK/Utils'

    ss.source_files = 'CRIMSDK/Model/*.{h,m}'
  end

  s.subspec 'Interface' do |ss|
    ss.dependency 'CRIMSDK/Model'
    ss.dependency 'CRIMSDK/CallbackProxy'
    ss.dependency 'CRIMSDK/Callbacker'

    ss.source_files = 'CRIMSDK/Interface/*.{h,m}'
  end

  s.subspec 'Callbacker' do |ss|
    ss.dependency 'CRIMSDK/Model'
    ss.dependency 'CRIMSDK/Utils'

    ss.source_files = 'CRIMSDK/Callbacker/*.{h,m}'
  end

  valid_archs = ['armv7s','arm64','x86_64']
  s.xcconfig = {
    'VALID_ARCHS' =>  valid_archs.join(' '),
  }

  s.pod_target_xcconfig = {
      'ARCHS[sdk=iphonesimulator*]' => '$(ARCHS_STANDARD_64_BIT)', 'DEFINES_MODULE' => 'YES'
  }

  s.frameworks = 'SystemConfiguration'
  
  s.static_framework = true

  s.dependency 'CRIMSDKCore', '1.0.3'
  s.dependency 'MJExtension'
end
