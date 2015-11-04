class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.references :category, index: true

      t.timestamps
    end
  end
end
