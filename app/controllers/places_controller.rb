class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate!, only: [:new, :edit, :create, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id])
    @booking = Booking.find_by(id: @place.booking)
    @bookings = Booking.find_by_sql ['SELECT start_time, end_time, name FROM bookings WHERE place_id = ?', @place]
    @photo = Photo.new
  end

  # GET /places/new
  def new


  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  # On create assign available to all dates for bookings
  def create
    current_user_type.places.create(place_params)
    redirect_to places_path
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
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

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end
    
    def current_user_type
      @current_user = user_signed_in? ? current_user : current_host
    end

    def authenticate!
      :authenticate_user! || :authenticate_host!
      current_user_type
   end

   

    # Only allow a list of trusted parameters through
    def place_params
      params.require(:place).permit(:park_name, :address, :zip_code, :phone, :photo, :cost, :user_id)
    end
end
