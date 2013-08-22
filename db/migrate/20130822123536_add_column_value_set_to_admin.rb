class AddColumnValueSetToAdmin < ActiveRecord::Migration
  def up
    
    add_column :admins, :value_set, :string
    
  end
  
  def down
    
    remove_column :admins, :value_set
    
  end
end
