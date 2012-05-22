class AppDelegate
	def application( application, didFinishLaunchingWithOptions:launchOptions )
		@torch = Torch.new
		@torch.turn_on
		@window = UIWindow.alloc.initWithFrame( UIScreen.mainScreen.bounds )
		@window.rootViewController = FlashlightViewController.alloc.init
		@window.makeKeyAndVisible
		true
	end
end
