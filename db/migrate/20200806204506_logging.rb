class Logging < ActiveRecord::Migration[6.0]
  def change
    create_table :webhits do |t|
      t.string :query
      t.string :client_ip
      t.datetime :created_at, null: false
    end
  end
end
