platform :ios, '9.0'
#inhibit_all_warnings!
use_frameworks!

target 'easeqs-objc-example' do
	project 'easeqs-objc-example'
    
    pod 'easeqs-objc', :path => './'
    pod 'JBChartView', :git => 'https://github.com/nikburnt/JBChartView.git'
    
	target 'easeqs-objc-example-tests' do
		inherit! :search_paths
        
        pod 'Specta', '~> 1.0'
        pod 'Expecta', '~> 1.0'
	end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
            config.build_settings['ENABLE_BITCODE'] = "NO"
        end
    end
end
