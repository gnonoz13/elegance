class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.text :description
      
      t.timestamps
    end
  end
end
