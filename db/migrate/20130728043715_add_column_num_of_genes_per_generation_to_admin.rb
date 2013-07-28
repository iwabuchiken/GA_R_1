class AddColumnNumOfGenesPerGenerationToAdmin < ActiveRecord::Migration
  def up
    add_column :admins, :genes_per_generation, :integer
  end
  
  def down
    remove_column :admins, :genes_per_generation
  end
end
