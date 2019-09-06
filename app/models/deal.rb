# frozen_string_literal: true

class Deal < ApplicationRecord
  belongs_to :deal_stage

  def as_json(options = nil)
    super({ only: %i[id name value] })
      .merge(options || {})
  end
end
