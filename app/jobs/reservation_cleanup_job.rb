# frozen_string_literal: true

class ReservationCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args); end
end
