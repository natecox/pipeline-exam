# frozen_string_literal: true

require 'test_helper'

class Api::DealStagesControllerTest < ActionDispatch::IntegrationTest
  test 'api returns stages' do
    get api_deal_stages_url

    assert_equal JSON.parse(response.body).count, DealStage.count
  end

  test 'api stages are ordered' do
    get api_deal_stages_url
    stage = JSON.parse(response.body).first

    assert_equal stage['id'], DealStage.order(:percent).first.id
  end

  test 'api stages include total values' do
    get api_deal_stages_url
    stage = JSON.parse(response.body).first

    assert_equal stage['total_value'], DealStage.order(:percent).first.total_value.to_s
  end
end
