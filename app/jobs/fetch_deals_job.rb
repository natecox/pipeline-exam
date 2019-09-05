# frozen_string_literal: true

class FetchDealsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    api_key = Rails.application.credentials.dig(:pipeline, :api_key)
    url = "https://api.pipelinedeals.com/api/v3/deals.json?api_key=#{api_key}"

    response = Net::HTTP.get(URI(url))
    stages, deals = parse_deal_data(JSON.parse(response)['entries'])

    upsert_stages(stages.uniq)
    upsert_deals(deals.uniq)
  end

  def parse_deal_data(entries)
    stages = []
    deals = []

    entries.each do |deal|
      stage = deal['deal_stage']
      stages << { id: stage['id'], percent: stage['percent'],
                  name: stage['name'] }
      deals << { id: deal['id'], name: deal['name'], value: deal['value'],
                 deal_stage_id: stage['id'] }
    end

    [stages, deals]
  end

  def upsert_stages(stages)
    DealStage.upsert_all(stages)
  end

  def upsert_deals(deals)
    Deal.upsert_all(deals)
  end
end
