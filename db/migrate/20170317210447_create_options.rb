class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.float :stock_prices
      t.float :strike_price
      t.date :time
      t.float :volatility
      t.boolean :is_call
      t.float :risk_free_rate
      t.timestamps
    end

  end
end