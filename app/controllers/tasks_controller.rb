class TasksController < ApplicationController
	before_action :find_project

	def index
		@tasks = @project.tasks
		@tasks = @project.tasks.where(user_id: current_user.id) if current_user.developer?
	end

	def new
		@task = Task.new
	end

	def edit
		@task = Task.find_by id: params[:id]
	end

	def create
		@task = @project.tasks.new name: task_params[:name], status: "New", user_id: task_params[:user_id]
		if @task.save!
			flash[:notice] = "task created sucessfully"
			redirect_to project_tasks_path(@project)
		else
			flash[:error] = "task not created"
			render action: :new
		end
	end

	def update
		@task = Task.find_by id: params[:id]
		@task.name = task_params[:name]
		@task.user_id = task_params[:user_id]
		if @task.save!
			flash[:notice] = "task created sucessfully"
			redirect_to project_tasks_path(@project)
		else
			flash[:error] = "task not created"
			render action: :edit
		end
	end

	def change_task_status
		@task = Task.find_by id: params[:id]
		@task.user_id = current_user.id if params[:status] == "In Progress"
		@task.user_id = nil if params[:status] == "New"
		@task.status = params[:status]
		if @task.save
			flash[:notice] = "Task updated...."
		else
			flash[:error] = "Some error occured..."
		end
		redirect_to project_tasks_path(@project)
	end

	private

	def task_params
		params.require(:task).permit(:name, :user_id)
	end

	def find_project
		@project = Project.find_by id: params[:project_id]
	end
end
