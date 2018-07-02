class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true, inclusion: { in: ["Travel", "Food", "Style", "Love", "Nightlife"] }
  validates :status, presence: true, inclusion: { in: ["Draft", "Posted"] }
  validates :date, presence: true
end
