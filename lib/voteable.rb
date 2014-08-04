module Voteable
  extend ActiveSupport::Concern

  included do
    
  end

  def vote_up(creator)
    self.votes.create(vote_value: true, creator: creator)
  end

  def vote_down(creator)
    self.votes.create(vote_value: false, creator: creator) 
  end

  def vote_count
    self.votes.where(vote_value: true).count - self.votes.where(vote_value: false).count
  end
end
