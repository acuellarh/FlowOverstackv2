class Question < ApplicationRecord
  belongs_to :user
  has_many :answer
  has_many :comments, as: :commentable
end
