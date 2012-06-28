$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
	app.deployment_target = '5.1'
	app.frameworks << 'AVFoundation'
	app.icons << 'icon.png'
	app.identifier = 'com.edgebound.Flashlight'
	app.interface_orientations = [ :portrait ]
	app.version = '0.8'

	app.name = 'Flashlight'
end
