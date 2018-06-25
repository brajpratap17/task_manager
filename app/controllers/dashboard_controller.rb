class DashboardController < ApplicationController
	def index
		@projects = Project.all.includes(:tasks) if params[:activity_for] == "Project"
		@developers = Developer.all.includes(:tasks) if params[:activity_for] == "Developer"
	end
end
