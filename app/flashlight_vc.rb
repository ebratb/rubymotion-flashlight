class	FlashlightViewController < UIViewController
	attr_accessor :torch

	BACKGORUND_IMAGES = { turned_on: 'background_on.png', turned_off: 'background_off.png', unavailable: 'background.png' }

	def loadView
		self.view = UIImageView.alloc.init
	end

	def viewDidLoad
		if @torch.available?
			update_background
			view.userInteractionEnabled = true
			tap_recognizer = UITapGestureRecognizer.alloc.initWithTarget( @torch, action: 'toggle_torch' )
			view.addGestureRecognizer( tap_recognizer )
			@torch.on_state_change{ update_background }
		else
			view.image = UIImage.imageNamed( BACKGORUND_IMAGES[ :unavailable ] )
		end
	end

	def update_background( torch = @torch )
		view.image = UIImage.imageNamed( BACKGORUND_IMAGES[ torch.turned_on? ? :turned_on : :turned_off ] )
	end

end
