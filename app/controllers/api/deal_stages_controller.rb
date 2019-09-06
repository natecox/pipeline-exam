# frozen_string_literal: true

class Api::DealStagesController < ApplicationController
  def index
    stages = Rails.cache.fetch('deal_stages') do
      DealStage.order(:percent)
    end

    render json: stages
  end
end
