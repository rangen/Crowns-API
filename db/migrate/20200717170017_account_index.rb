class AccountIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :twitter_accounts, [:politician_id, :politician_type]
  end
end
