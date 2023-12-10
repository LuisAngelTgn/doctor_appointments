class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role == "patient"
      @appointments = Appointment.where(patient_id: current_user.id)
    elsif current_user.role == "doctor"
      @appointments = Appointment.where(doctor_id: current_user.id)
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    @appointment.save!
    if @appointment.save
      redirect_to appointments_path, notice: 'Cita creada exitosamente.'
    else
      render :new
    end
  end

  def edit
    if current_user.role == "patient"
    @appointment = current_user.appointments.find(params[:id])
    else
      doctor_id = current_user.id
      appointments = Appointment.where(doctor_id: doctor_id)
      @appointment = appointments.find(params[:id])
    end
  end

  def update
    @appointment = current_user.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Cita actualizada exitosamente.'
    else
      render :edit
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    if current_user.id == @appointment.doctor_id || current_user.id == @appointment.patient_id
      @doctor_name = User.find_by(id: @appointment.doctor_id)
      @patient_name = User.find_by(id: @appointment.patient_id)
    else
      redirect_to root_path, alert: "You're not allowed to see this appointment."
    end
  end

  def destroy
    @appointment = current_user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, notice: 'Cita eliminada exitosamente.'
  end

  def doctors_search
    doctor_name = params[:doctor_name]
    city = params[:city]

    if doctor_name.present?
    @doctors = User.where(role: 'doctor').where('LOWER(name) LIKE ?', "%#{doctor_name.downcase}%")
    end

    if city.present?
      @doctors = User.where(role: 'doctor').where('LOWER(city) LIKE ?', "%#{city.downcase}%")
    end

    respond_to do |format|
      format.html { render partial: 'doctor_search_results', locals: { doctors: @doctors } }
      format.json { render json: @doctors.map { |doctor| { id: doctor.id, name: doctor.name } } }
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:scheduled_at, :description, :doctor_id, :patient_id, pictures: [])
  end

end
