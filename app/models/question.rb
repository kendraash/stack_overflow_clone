class Question<ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable

  default_scope {order('created_at DESC')}

  before_save :append_question_mark

  def vote_count
    total = 0
    self.votes.each do |vote|
      total += vote.count
    end
    return total
  end

  def sorted_answers
    self.answers.sort_by { |a| (a.vote_count) }.reverse!
  end

  private
  def append_question_mark
    unless self.title.scan(/[?]/).any?
      self.title += "?"
    end
  end
end
