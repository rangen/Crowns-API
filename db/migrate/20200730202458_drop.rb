class Drop < ActiveRecord::Migration[6.0]
  def change
    drop_table :issues
    drop_table :votes
    remove_column :reps, :election_year
    remove_column :reps, :cand_address_1
    remove_column :reps, :cand_address_2
    remove_column :reps, :cand_city
    remove_column :reps, :cand_state
    remove_column :reps, :cand_zip
    remove_column :senators, :election_year
    remove_column :senators, :cand_address_1
    remove_column :senators, :cand_address_2
    remove_column :senators, :cand_city
    remove_column :senators, :cand_state
    remove_column :senators, :cand_zip

  end
end
