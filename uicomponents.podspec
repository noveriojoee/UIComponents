Pod::Spec.new do |s|
  s.name         = "uicomponents"
  s.version      = "1.0.0"
  s.summary      = "Themming and general UI component library"
  s.description  = "this library containing general UI Component which will be consumed by other modules"

  s.homepage     = "https://github.com/noveriojoee/UIComponents"
  s.license      = { :type => "MIT", :text => "The MIT License (MIT) \n Copyright (c) Noveriojoee <noverio.joe.hasibuan@outlook.co.id> \n Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files" }
  s.author             = { "noveriojoee" => "noverio.joe.hasibuan@outlook.co.id" }  
  s.source       = { :git => "https://github.com/noveriojoee/UIComponents", 
                     :tag => "#{s.version}" }

  s.resources = "uicomponents/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  s.source_files = "uicomponents/**/*.{h,m}"
  s.ios.deployment_target = '9.0'
  #s.static_framework = true

  # Specified all the dependencies here
  #s.dependency 'ActionSheetPicker-3.0'
  s.dependency 'Shimmer', '~> 1.0'
  s.dependency 'lottie-ios', '2.5.3'
  s.dependency 'GoogleMobileVision/FaceDetector'

  s.exclude_files = "Classes/Exclude"
end
