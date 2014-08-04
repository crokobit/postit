class AddVoteValueToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :vote_value, :boolean
  end
end
