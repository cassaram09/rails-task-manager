class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :responsibilities
  has_many :comments
  has_many :tasks
  has_many :notes       
  enum role: [:user, :admin]
end
