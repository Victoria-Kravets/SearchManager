
platform :ios, '11.0'
use_frameworks!

def settings
    platform :ios, '11.0'
end

def pods
    pod 'RealmSwift', '~>3.0.2' 
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
