class Assignment < ApplicationRecord
	belongs_to :developer, foreign_key: :user_id
	belongs_to :project
end
