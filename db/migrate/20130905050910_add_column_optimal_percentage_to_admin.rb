class AddColumnOptimalPercentageToAdmin < ActiveRecord::Migration
  def up
    
    # REF http://stackoverflow.com/questions/4384284/rails-generate-model-fieldtype-what-are-the-options-for-fieldtype answered Dec 8 '10 at 5:02
    #add_column :admins, :optimal_percentage, :float
    add_column :admins, :optimal_percentage, :string
    
  end
  
  def down
    
    remove_column :admins, :optimal_percentage
    
  end
  
end
