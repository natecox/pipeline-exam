# frozen_string_literal: true

class CreateDealStages < ActiveRecord::Migration[6.0]
  def change
    create_table :deal_stages do |t|
      t.integer :percent
      t.string :name
    end
  end
end
