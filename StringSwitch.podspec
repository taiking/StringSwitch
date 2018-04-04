Pod::Spec.new do |s|
  s.name             = 'StringSwitch'
  s.version          = '0.1.0'
  s.summary          = 'Like UISwitch with string.'

  s.homepage         = 'https://github.com/chocovayashi/StringSwitch'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chocovayashi' => 'c.tsujiyan727@gmail.com' }
  s.source           = { :git => 'https://github.com/chocovayashi/StringSwitch.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = { "SWIFT_VERSION" => "4.0" }

  s.source_files = 'StringSwitch/Classes/**/*'
end
