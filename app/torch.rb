class Torch

	def initialize
		back_camera = AVCaptureDevice.defaultDeviceWithMediaType( AVMediaTypeVideo )
		if back_camera.torchAvailable? && back_camera.isTorchModeSupported( AVCaptureTorchModeOn )
			@back_camera = back_camera
		end if back_camera
	end

	def turn_on
		update_config { |back_camera| back_camera.torchMode = AVCaptureTorchModeOn }
	end

	def turn_off
		update_config { |back_camera| back_camera.torchMode = AVCaptureTorchModeOff }
	end

private
	def update_config
		return false unless @back_camera
		locked = @back_camera.lockForConfiguration( nil )
		begin
			success = yield @back_camera if locked
		ensure
			@back_camera.unlockForConfiguration if locked
		end
		success || locked
	end

end
