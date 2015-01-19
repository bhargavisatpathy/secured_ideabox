class Idea < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  belongs_to :category
end
