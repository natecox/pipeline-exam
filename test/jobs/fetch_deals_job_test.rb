# frozen_string_literal: true

require 'test_helper'

class FetchDealsJobTest < ActiveJob::TestCase
  setup do
    api_key = Rails.application.credentials.dig(:pipeline, :api_key)
    deal = { entries: [
      { id: 1, name: 'test', value: '100.00',
        deal_stage: { id: 2, percent: 10, name: 'stage' } }
    ] }

    stub_request(:get, "https://api.pipelinedeals.com/api/v3/deals.json?api_key=#{api_key}")
      .with(headers: { 'Host': 'api.pipelinedeals.com', 'User-Agent': 'Ruby' })
      .to_return(status: 200, body: JSON.generate(deal), headers: {})
  end

  test 'inserts retrieved deals' do
    assert_difference ['Deal.count', 'DealStage.count'] do
      FetchDealsJob.perform_now
    end
  end
end
