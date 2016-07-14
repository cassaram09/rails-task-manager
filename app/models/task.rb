class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments
  has_many :task_tags
  has_many :tags, through: :task_tags

  enum status: = [:active, :on_hold, :complete]
  enum priority: = [:low, :medium, :high, :urgent]
end
