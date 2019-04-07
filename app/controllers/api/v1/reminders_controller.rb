class Api::V1::RemindersController < ApplicationController
  def update
    @reminder = Reminder.find_by(id: reminder_params[:id])
    puts reminder_params
    @reminder.change(reminder_params[:type], reminder_params[:text])
    @reminder.save
    render json: { reminder: ReminderSerializer.new(@reminder) }, status: :accepted
  end
  private
    def reminder_params
      params.require(:reminder).permit(:id, :type, :text)
    end
end
