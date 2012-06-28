class Torch

	def initialize
		back_camera = AVCaptureDevice.defaultDeviceWithMediaType( AVMediaTypeVideo )
		if back_camera.torchAvailable? && back_camera.isTorchModeSupported( AVCaptureTorchModeOn )
			@back_camera = back_camera
		end if back_camera
		@listeners = []
	end

	def available?
		@back_camera || false
	end

	def turn_on
		update_config { |back_camera| back_camera.torchMode = AVCaptureTorchModeOn }
		@listeners.each{ |listener| listener.call( self ) }
	end

	def turn_off
		update_config { |back_camera| back_camera.torchMode = AVCaptureTorchModeOff }
		@listeners.each{ |listener| listener.call( self ) }
	end

	def turned_on?
		return false unless available?
		@back_camera.torchMode == AVCaptureTorchModeOn
	end

	def toggle_torch
		turned_on? ? turn_off : turn_on
	end

	def on_state_change( &listener )
		@listeners << listener if block_given?
	end

private

	def update_config
		return false unless available?
		locked = @back_camera.lockForConfiguration( nil )
		success = false
		begin
			success = yield @back_camera if locked
		ensure
			@back_camera.unlockForConfiguration if locked
		end
		success
	end

end
