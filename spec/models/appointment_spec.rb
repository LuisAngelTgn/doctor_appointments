require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it "is valid with valid attributes" do
    appointment = Appointment.new(patient_id: 1, doctor_id: 2,  scheduled_at: "Sat, 03 Aug 2024 20:46:00.000000000 UTC +00:00", description: "test")
    expect(appointment).to be_valid
  end

  it "is not valid without a patient_id" do
    appointment = Appointment.new(patient_id: 1)
    expect(appointment).not_to be_valid
  end

  it "is not valid without a doctor_id" do
    appointment = Appointment.new(doctor_id: 2)
    expect(appointment).not_to be_valid
  end

  it "is not valid without a scheduled_at" do
    appointment = Appointment.new(scheduled_at: "Sat, 03 Aug 2024 20:46:00.000000000 UTC +00:00")
    expect(appointment).not_to be_valid
  end

  it "is not valid without an description" do
    appointment = Appointment.new(description: "test")
    expect(appointment).not_to be_valid
  end
  
end
