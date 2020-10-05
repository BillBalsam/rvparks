class HostsController < ApplicationController
    def show
        @places = Place.all
        @host = Host.find(params[:id])
    end   
end
