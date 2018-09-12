class CreateCriticConsensus < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :critic_consensus, :text
  end
end
