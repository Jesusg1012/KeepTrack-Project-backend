class Api::V1::RemindersController < ApplicationController
  def update
    @reminder = Reminder.find_by(id: reminder_params[:id])
    puts reminder_params
    @reminder.change(reminder_params[:type], reminder_params[:text])
    @reminder.save
    render json: { user: UserSerializer.new(@reminder.imageable) }, status: :accepted
  end
  def notification
    @reminder = Reminder.find_by(id: reminder_params[:id])
    if(reminder_params[:type] == "email")
      @reminder.email = !@reminder.email
    elsif(reminder_params[:type] == "phone")
      @reminder.phone = !@reminder.phone
    end
    @reminder.save
    render json: { user: UserSerializer.new(@reminder.imageable) }, status: :accepted
  end
  private
    def reminder_params
      params.require(:reminder).permit(:id, :type, :text)
    end
end
