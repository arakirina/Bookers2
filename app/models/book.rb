class Book < ApplicationRecord
  
  validates :title, presence: true
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true
  
end
