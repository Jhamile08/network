class User < ApplicationRecord
  enum role: %i[writer admin]
  after_initialize :set_default_role,
                   def set_default_role
                     self.role ||= :writer
                   end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :publications
end
