class ShobuSerializer
    def self.pieces_serialize(pieces)
        pieces_obj = {}
        pieces.each do |piece|
            piece_obj = {url: piece.url, rotation: piece.rotation, color: piece.color, playerId: piece.player_id }
            pieces_obj[piece.id] = piece_obj
        end
        pieces_obj
    end

    def self.player_serialize(player)
        {name: player.name, url: player.url, primary: player.primary}
    end
end