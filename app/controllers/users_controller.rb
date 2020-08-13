class UsersController < ApplicationController
    def index
        # this is the first get request for reloading all current board data
        # sends board data and data about pieces, users
        # essentially everything a create game would send back, but not actually creating anything
    end
end
