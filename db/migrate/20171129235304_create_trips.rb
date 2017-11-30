require 'date'

class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer  :duration
      t.datetime :start_date
      t.text     :start_station
      t.datetime :end_date
      t.text     :end_station
      t.integer  :bike_id
      t.text     :subscription_type
      t.string   :zip_code

      # t.timestamps null: false
    end
  end
end
