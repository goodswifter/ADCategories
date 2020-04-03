Pod::Spec.new do |s|
  s.name             = 'ADCategories'
  s.version          = '0.1.0'
  s.summary          = 'ADCategories.'
  s.description      = 'ADCategories description'

  s.homepage         = 'https://github.com/goodswifter/ADCategories'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'goodswifter' => '1042480866@qq.com' }
  s.source           = { :git => 'https://github.com/goodswifter/ADCategories.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'ADCategories/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ADCategories' => ['ADCategories/Assets/*.png']
  # }
end
