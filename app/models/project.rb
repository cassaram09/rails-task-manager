class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :tags, through: :tasks
  has_many :comments, through: :tasks
  enum status: [:active, :on_hold, :complete]

  scope :complete, -> { where(status: 2) }
  scope :on_hold, -> { where(status: 1) }
  scope :active, -> { where(status: 0)}
  scope :user_active, -> (user_id) { where(status: 0, :user_id => user_id) }
  scope :user_on_hold, -> (user_id) { where(status: 1, :user_id => user_id) }
  scope :user_complete, -> (user_id) { where(status: 2, :user_id => user_id) }

  validates :name, :description, :due_date, :status, presence: true
end
