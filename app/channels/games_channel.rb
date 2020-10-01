class GamesChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    # stream_from "some_channel"
    player_id = JWT.decode(params[:jwt], "Shobu")[0].to_i
    player = Player.find(player_id)
    @game = player.game
    stream_for @game
  end

  def received(data)
    byebug
    GamesChannel.broadcast_to(@game, data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
