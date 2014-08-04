module Voteable
  extend ActiveSupport::Concern

  included do
    
  end

  def vote_up
    self.votes.create(vote_value: true) 
  end

  def vote_down
    self.votes.create(vote_value: false) 
  end

  def vote_count
    Vote.where(vote_value: true).count - Vote.where(vote_value: false).count
  end
end
