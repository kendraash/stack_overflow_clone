class Answer<ActiveRecord::Base
  validates_presence_of :content
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votable

  def vote_count
    total = 0
    self.votes.each do |vote|
      total += vote.count
    end
    return total
  end

  default_scope {order('created_at DESC')}
end
