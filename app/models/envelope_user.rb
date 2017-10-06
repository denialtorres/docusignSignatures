class EnvelopeUser < ApplicationRecord
  belongs_to :envelope
  belongs_to :user
end
