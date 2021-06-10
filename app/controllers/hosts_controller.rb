class HostsController < ApplicationController
    def show
        @places = Place.all
        @host = Host.find(params[:id])
    end   

    def update
        @host = Host.update(host_params)

            redirect_to host_path, notice: 'Host photo has been uploaded.'

    end

    private

    def host_params
        params.require(:host).permit(:avatar, :first_name, :last_name, :address, :phone_number, :birth_date)
    end

end
