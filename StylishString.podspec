Pod::Spec.new do |s|
  s.name             = "StylishString"
  s.version          = "0.0.1"
  s.summary          = "A stylish library for creating NSAttributedStrings"
  s.description      = "A stylish library for creating NSAttributedStrings"
  s.homepage         = "https://github.com/hkellaway/StylishString"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Harlan Kellaway" => "hello@harlankellaway.com" }
  s.social_media_url = "http://twitter.com/HarlanKellaway"
  s.source           = { :git => "https://github.com/hkellaway/StylishString.git", :tag => s.version.to_s }
  
  s.platforms     = { :ios => "8.0", :osx => "10.9", :tvos => "9.0", :watchos => "2.0" }
  s.requires_arc = true

  s.source_files     = 'Source/*.{swift}'

end
