# frozen_string_literal: true

namespace :deals do
  desc 'Populate your DB via pipeline API'

  task fetch: :environment do
    FetchDealsJob.perform_now
  end
end
