module ProjectsHelper
	def checked_category(id)
		if params[:category].nil? || params[:category].map(&:to_i).include?(id)
			"checked"
		end
	end
end
