class HostsController < ApplicationController
    def index
        @places = Place.all
    end
    
    def show
        @place = Place.find(params[:id])
    end
    def update
        respond_to do |format|
          if @place.update(place_params)
            format.html { redirect_to @place, notice: 'Place was successfully updated.' }
            format.json { render :show, status: :ok, location: @place }
          else
            format.html { render :edit }
            format.json { render json: @place.errors, status: :unprocessable_entity }
          end
        end
    end
end
