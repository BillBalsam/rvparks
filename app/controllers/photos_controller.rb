class PhotosController < ApplicationController
    def create
        @place = Place.find(params[:id])
        @place.photos.create(photo_params.merge(user: current_user))
        redirect_to place_path(@place)
    end

    private

    def photo_params
        params.require(:photo).permit(:comment, :placeable_id)

    end

end
