class TweetCount < ActiveRecord::Migration[6.0]
  def change
    add_column :twitter_accounts, :tweet_count, :integer
  end
end
