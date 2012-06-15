class Torch

	def initialize
		back_camera = AVCaptureDevice.defaultDeviceWithMediaType( AVMediaTypeVideo )
		if back_camera.torchAvailable? && back_camera.isTorchModeSupported( AVCaptureTorchModeOn )
			@back_camera = back_camera
		end if back_camera
	end

	def available?
		@back_camera || false
	end

	def turn_on
		update_config { |back_camera| back_camera.torchMode = AVCaptureTorchModeOn }
	end

	def turn_off
		update_config { |back_camera| back_camera.torchMode = AVCaptureTorchModeOff }
	end

	def toggle_torch
		return false unless available?
		@back_camera.torchMode == AVCaptureTorchModeOn ? turn_off : turn_on
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
