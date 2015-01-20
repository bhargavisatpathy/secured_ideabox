class Idea < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  belongs_to :category
  has_many :imagings
  has_many :images, through: :imagings

  def user_id
    user.id
  end
end
