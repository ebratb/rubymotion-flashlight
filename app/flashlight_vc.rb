class	FlashlightViewController < UIViewController
	attr_accessor :torch

	def loadView
		self.view = UIImageView.alloc.init
	end

	def viewDidLoad
		view.image = UIImage.imageNamed( 'background.png' )
		view.userInteractionEnabled = true
		tap_recognizer = UITapGestureRecognizer.alloc.initWithTarget( self, action: 'toggle_torch' )
		view.addGestureRecognizer( tap_recognizer )
	end

	def toggle_torch
		# change background image
		@torch.toggle_torch
	end

end
