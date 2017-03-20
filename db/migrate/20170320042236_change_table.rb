class ChangeTable < ActiveRecord::Migration[5.0]
  def change
    rename_column("options", "stock_prices", "stock_price")
    remove_column("options", "time")
    add_column("options", "time", :integer)
  end
end
