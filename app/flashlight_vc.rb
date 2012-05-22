class	FlashlightViewController < UIViewController

	def loadView
		self.view = UIImageView.alloc.init
	end

	def viewDidLoad
		self.view.image = UIImage.imageNamed( 'background.png' )
	end

end
