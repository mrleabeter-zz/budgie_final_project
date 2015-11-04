class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.references :company, index: true
      t.references :user, index: true
      t.references :category, index: true
      t.integer :discount_percent
      t.string :restrictions

      t.timestamps
    end
  end
end
