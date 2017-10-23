
Pod::Spec.new do |s|
  s.name			= 'FSRefresh-ObjC'
  s.version		= '0.1.0'
  s.summary		= 'A short description of FSRefresh-ObjC.'
  s.homepage	= 'https://github.com/Allen/FSRefresh-ObjC'
  s.license		= { :type => 'MIT', :file => 'LICENSE' }
  s.author		= { 'Allen' => 'lifution@icloud.com' }
  s.source		= { 
  	:git => 'https://github.com/Allen/FSRefresh-ObjC.git', 
  	:tag => s.version.to_s 
  }
  
  s.frameworks = 'UIKit', 'Foundation'
  s.ios.deployment_target = '8.0'

  s.source_files = 'FSRefresh-ObjC/Classes/**/*'
  s.resource = 'FSRefresh-ObjC/Assets/*'
end
