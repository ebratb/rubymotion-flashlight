class	FlashlightViewController < UIViewController
	attr_accessor :torch

	BACKGORUND_IMAGES = { turned_on: 'background.png', turned_off: 'background.png', unavailable: 'background.png' }

	def loadView
		self.view = UIImageView.alloc.init
	end

	def viewDidLoad
		view.image = UIImage.imageNamed( BACKGORUND_IMAGES[ @torch.available? ? :turned_on : :unavailable ] )
		view.userInteractionEnabled = true
		tap_recognizer = UITapGestureRecognizer.alloc.initWithTarget( self, action: 'toggle_torch' )
		view.addGestureRecognizer( tap_recognizer )
	end

	def toggle_torch
		background_image = ''
		@torch.toggle_torch
	end

end
