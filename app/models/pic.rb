class Pic < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_one_attached :image

  def self.search(search)
    if search != ""
      Pic.where('text Like(?)', "%#{search}%")
    else
      Pic.all 
    end
  end
end
