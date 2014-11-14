class Car2goWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(5) }

  def perform
    Car2go.fetch_cars
  end
end
