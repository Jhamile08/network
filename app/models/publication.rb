class Publication < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :last_month, -> { where('created_at >= ?', 1.month.ago.beginning_of_month) }
  scope :last_week, -> { where('created_at >= ?', 1.week.ago.beginning_of_week) }
  scope :today, -> { where('created_at >= ?', Date.today.beginning_of_day) }

  validates :title, :content, :user_id, :category_id, presence: true
end
