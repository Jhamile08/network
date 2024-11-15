class Comment < ApplicationRecord
  belongs_to :publication

  validates :content, presence: true
end
