class Game < ApplicationRecord
    has_many :players
    has_many :rounds

    validates :player_count, numericality: { less_than_or_equal_to: 10 }
end
