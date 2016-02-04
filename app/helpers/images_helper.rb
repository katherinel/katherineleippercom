module ImagesHelper
	def form_image_is_default(i)
		i.object.new_record? ? false : i.object.is_default?
	end
end
