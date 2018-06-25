class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable

  validates_uniqueness_of :email
  validates :email, :name, :type, presence: true

  def admin?
  	type == "Admin"
  end

  def developer?
  	type == "Developer"
  end
end
