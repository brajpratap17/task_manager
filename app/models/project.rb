class Project < ApplicationRecord
	
	validates :name, presence: true

	belongs_to :admin, foreign_key: :user_id
	has_many :assignments
	has_many :developers, through: :assignments
	has_many :tasks, dependent: :destroy

end
