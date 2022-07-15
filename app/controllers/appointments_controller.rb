class AppointmentsController < ApplicationController
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
       render json: @appointment
    else
      render json: @appointment.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :user_id, :doctor_id)
  end
end