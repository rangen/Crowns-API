class LoggingTwo < ActiveRecord::Migration[6.0]
  def change
    add_column :webhits, :normalized, :string
    add_column :webhits, :district_id, :integer
  end
end
