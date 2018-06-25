class Developer < User
	has_many :assignments, foreign_key: :user_id
	has_many :projects, through: :assignments
	has_many :tasks, foreign_key: :user_id
end