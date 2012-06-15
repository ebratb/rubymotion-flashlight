class AppDelegate
	def application( application, didFinishLaunchingWithOptions:launchOptions )
		@torch = Torch.new
		@window = UIWindow.alloc.initWithFrame( UIScreen.mainScreen.bounds )
		@window.rootViewController = FlashlightViewController.alloc.init
		@window.rootViewController.torch = @torch
		@window.makeKeyAndVisible
		true
	end

	def applicationDidBecomeActive( application )
		@torch.turn_on
	end

	def applicationDidEnterBackground( application )
		@torch.turn_off
	end

	def applicationWillTerminate( application )
		@torch.turn_off
	end

end
