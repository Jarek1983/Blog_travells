module ApplicationHelper

	def active_link_to (nav_link, contrl, action, url, style)
		if controller_name == contrl && action_name == action
			return link_to nav_link, url, id: style
		else
			return link_to nav_link, url, class: style
		end
	end

end
