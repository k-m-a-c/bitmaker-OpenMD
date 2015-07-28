class PatientSessionsController < ApplicationController

    def new
        @patient = Patient.new
    end

    def create
      if @patient = patient_login(params[:email], params[:password])
          redirect_back_or_to(:patients, notice: 'Login successful')
      else
          flash.now[:alert] = 'Login failed'
          render action: 'new'
      end
    end

    def destroy
      patient_logout
      redirect_to(:patients, notice: 'Logged out!')
    end
end