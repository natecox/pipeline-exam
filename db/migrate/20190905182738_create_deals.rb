# frozen_string_literal: true

class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :deal_stage, null: false, foreign_key: true
      t.string :name
      t.decimal :value
    end
  end
end
