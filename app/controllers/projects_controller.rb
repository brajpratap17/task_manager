class ProjectsController < ApplicationController
	before_action :find_developers, on: [:new, :edit]

	def index
		@projects = current_user.projects.includes(:tasks)
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find_by id: params[:id]
	end

	def create
		@project = current_user.projects.build name: project_params[:name]
		if @project.save!
			@project.assign_attributes name: '', developer_ids: project_params[:developers][:ids]
			flash[:notice] = "Project created sucessfully"
			redirect_to projects_path
		else
			flash[:error] = "Project not created"
			render action: :new
		end
	end

	def update
		@project = Project.find_by id: params[:id]
		@project.name = project_params[:name]
		if @project.save!
			@project.assign_attributes name: '', developer_ids: project_params[:developers][:ids]
			flash[:notice] = "Project updated sucessfully"
			redirect_to projects_path
		else
			flash[:error] = "Project not updated"
			render action: :edit
		end
	end

	private

	def project_params
		params.require(:project).permit :name, { developers: { ids: [] } }
	end

	def find_developers
		@developers = Developer.all
	end
end
