Pod::Spec.new do |s|

  s.name         = "UIGradient"
  s.version      = "1.2.0"
  s.summary      = "A simple and powerful library for using gradient image, color"
  s.homepage     = "https://github.com/dqhieu/UIGradient"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Đinh Quang Hiếu" => "dqhieu13@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/dqhieu/UIGradient.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/*.swift"

end