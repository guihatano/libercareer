# frozen_string_literal: true

class License < ApplicationRecord
  belongs_to :person

  def expired?
    expiration_date < Date.today
  end
end
