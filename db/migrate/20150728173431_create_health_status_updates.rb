class CreateHealthStatusUpdates < ActiveRecord::Migration
  def change
    create_table :health_status_updates do |t|
      t.integer :respiratory_rate
      t.integer :heart_rate
      t.integer :body_temperature
      t.integer :blood_pressure
      t.integer :physical_health_score
      t.integer :mental_health_score


      t.timestamps null: false
    end
  end
end
