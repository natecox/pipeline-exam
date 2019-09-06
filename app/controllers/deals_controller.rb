# frozen_string_literal: true

class DealsController < ApplicationController
  def index
    @deals = Deal.all.includes(:deal_stage)
  end
end
