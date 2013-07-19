class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :current_generation
      t.integer :num_of_gene_elements

      t.timestamps
    end
  end
end
