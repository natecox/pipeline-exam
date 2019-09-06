# frozen_string_literal: true

class DealStage < ApplicationRecord
  has_many :deals

  def total_value
    deals.sum('deals.value')
  end

  def as_json(options = nil)
    super({ only: %i[id name percent], methods: [:total_value] })
      .merge(options || {})
  end
end
