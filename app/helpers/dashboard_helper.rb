module DashboardHelper
	
	def user_dashboard
		if current_user.admin?
			"admin"
		else
			"developer"
		end
	end

end
