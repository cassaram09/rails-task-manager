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

  def tags
    tags = self.tasks.collect do |task|
      task.tags.collect {|tag| tag}
    end.flatten
  end

  def active_projects
    self.projects.active 
  end

  def complete_projects
    self.projects.active 
  end

  def on_hold_projects
    self.projects.on_hold
  end

  def all_tasks
    self.projects.map do |project|
      project.tasks
    end.flatten
  end
end
