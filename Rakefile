$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
	app.deployment_target = '5.1'
	app.frameworks << 'AVFoundation'
	app.interface_orientations = [ :portrait ]
	app.identifier = 'com.edgebound.Flashlight'
	app.name = 'Flashlight'
	app.icons << 'icon.png'
end
