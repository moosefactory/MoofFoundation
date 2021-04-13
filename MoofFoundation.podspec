#
# Be sure to run `pod lib lint MoofFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name             = "MoofFoundation"
	s.version          = "1.0.1"
	s.summary          = "MoofFoundation is a cross-platofrm (iOS/MacOS) Utility Library."
	s.description      = <<-DESC
					MoofFoundation is a cross-platform (iOS/MacOS) Utility Library.
					It adds convenient functions to primitive types, CoreGraphics and system utilities
					   DESC
	s.homepage         = "https://github.com/MooseFactory/MoofFoundation"
	s.license          = 'MIT'
	s.author           = { "Tristan Leblanc" => "tristan@moosefactory.eu" }
	s.source           = { :git => "https://github.com/moosefactory/MoofFoundation.git", :tag => s.version.to_s }
	s.social_media_url = 'https://twitter.com/moosefactory_eu'

	s.ios.deployment_target = '13.3'
    s.osx.deployment_target = '10.15'
    s.tvos.deployment_target = '14.0'
    s.watchos.deployment_target = '7.0'
                                                        
	s.requires_arc = true

	s.source_files = 'MoofFoundation/MoofFoundation.h', 'MoofFoundation/Sources/**/*.*'
end
