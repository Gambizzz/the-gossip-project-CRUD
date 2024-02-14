class Gossip < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 20}
  validates :content, presence: true
  belongs_to :user, optional: true
  has_many :tags
end
