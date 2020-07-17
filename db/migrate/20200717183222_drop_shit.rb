class DropShit < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_mentions
    drop_table :hashtags_tweets
    drop_table :hashtags
  end
end
