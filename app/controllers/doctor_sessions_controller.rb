class DoctorSessionsController < ApplicationController

    def new
        @doctor = Doctor.new
    end

    def create
      if @doctor = login(params[:email], params[:password])
          redirect_back_or_to(:doctors, notice: 'Login successful')
      else
          flash.now[:alert] = 'Login failed'
          render action: 'new'
      end
    end

    def destroy
      logout
      redirect_to(:doctors, notice: 'Logged out!')
    end

end