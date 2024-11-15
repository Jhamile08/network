class Publication < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  validates :title, :content, :user_id, :category_id, presence: true
end
