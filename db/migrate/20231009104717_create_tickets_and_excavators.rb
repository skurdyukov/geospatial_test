class CreateTicketsAndExcavators < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string   :request_number
      t.string   :request_type
      t.string   :request_action
      t.datetime :response_due_date_time
      t.string   :primary_service_area_code
      t.string   :additional_service_area_codes, array: true, default: []
      t.string   :well_known_text_shape

      t.timestamps
    end

    create_table :excavators do |t|
      t.string   :company_name
      t.string   :full_address
      t.boolean  :crew_on_site

      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
