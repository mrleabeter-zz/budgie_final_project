class AddImagesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :logo, :string
    add_column :companies, :store_pic, :string
  end
end
