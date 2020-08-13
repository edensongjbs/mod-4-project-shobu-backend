class Player < ApplicationRecord
    belongs_to :game
    has_many :pieces
    has_many :moves, through: :pieces
    after_create :generate_url

    def generate_url
        self.update_attributes(url: JWT.encode(self.id.to_s, "Shobu"))
    end

end
  