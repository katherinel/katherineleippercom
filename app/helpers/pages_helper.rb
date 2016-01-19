module PagesHelper
	def proj_title_bkgd(p)
		if p.image_matching_color?
			hex = p.image_matching_color
			length = hex.length # figure out if it's a 6-char or 3-char color
			rgb = hex.scan(/.{1,#{length/3}}/).map! {|h| h.hex} # convert to rgb in singles or pairs
			rgb_string = rgb.join(", ")
			"background-color: rgba(#{rgb_string}, 0.7);"
		else
			"background-color: rgba(0, 0, 0, 0.7);"
		end
	end
end
