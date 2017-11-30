
class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.text    :duration
      t.datetime    :start_date
      t.text    :start_station_name
      t.datetime    :end_date
      t.text    :end_station_name
      t.text    :bike_id
      t.text    :subscription_type
      t.text :zip_code

      # t.timestamps null: false
    end
  end
end
