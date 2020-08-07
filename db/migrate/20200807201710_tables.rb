class Tables < ActiveRecord::Migration[6.0]
  def change
    create_table :random_queries do |t|
      t.string :client_ip
      t.integer :district_id
      t.string :district_name
      t.datetime :created_at, null: false
    end
    
    create_table :failed_queries do |t|
      t.string :client_ip
      t.string :query
      t.datetime :created_at, null: false
    end

    add_column :webhits, :district_name, :string
  end
end
