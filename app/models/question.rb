# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  content    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  validates :title, :content, presence: true

  def voted_by?(user)
    votes.exists?(user: user)    
  end

  def self.search(search)
    search ? where(['title LIKE ?', "%#{search}%"]) :all    
    search ? where(['content LIKE ?', "%#{search}%"]) :all    
  end
end
