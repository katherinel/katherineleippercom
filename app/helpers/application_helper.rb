module ApplicationHelper
	def menu_highlight(link)
		if (link == "projects" && params[:controller] == "projects") ||
			(link == "educational" && params[:action] == "educational") ||
			(link == "about" && params[:action] == "about")
			"highlighted"
		end
	end
end
