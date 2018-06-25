module TasksHelper
	def action_links(task)
		html = []
		if current_user.admin?
			html << link_to('Edit', edit_project_task_path(id: task.id)).to_s
		else
			if task.status == 'Done'
				html << "<span style='color:blue;'>Completed</span>"
			else
				html << link_to('In Progress', change_task_status_project_task_path(id: task.id, status: 'In Progress'))
				html << link_to('Done', change_task_status_project_task_path(id: task.id, status: 'Done'))
			end
		end
		html.join(" ").html_safe
	end
end
