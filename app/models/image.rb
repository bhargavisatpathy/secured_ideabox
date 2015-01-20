class Image < ActiveRecord::Base
  validates :name, :url, presence: true

  has_many :imagings
  has_many :ideas, through: :imagings
end
