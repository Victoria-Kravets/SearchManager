
platform :ios, '11.0'
use_frameworks!

def settings
    platform :ios, '11.0'
end

def pods
    pod 'RealmSwift', '~>3.0.2' 
    pod 'ObjectMapper', '~> 2.2.9'
end

def test_pods
    pod 'Nimble', '~>7.0.0'
    pod 'Quick', '~>1.2.0'
end

def setup
   settings
   pods 
end

def test_setup
    setup
    test_pods 
end

target 'SearchManager' do
    setup
end

target 'SearchManagerTests' do
    test_setup
end

pods3 = ['ObjectMapper']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if pods3.include? target.to_s
            version = '3.2'
            
            target.build_configurations.each do |config|
                config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
                config.build_settings['SWIFT_VERSION'] = version
            end
        end
    end
end
