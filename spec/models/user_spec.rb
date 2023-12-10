require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    doctor = User.create(name: "Doctor Name", role: "doctor", email: "doctor@example.com", password: "123456")
    patient = User.create(name: "Patient Name", role: "patient", email: "patient@example.com", password: "123456")
    appointment = Appointment.new(
      patient: patient,
      doctor: doctor,
      scheduled_at: "Sat, 03 Aug 2024 20:46:00.000000000 UTC +00:00",
      description: "test"
    )

    expect(appointment).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(email: "john@example.com")
    expect(user).not_to be_valid
  end

  it "is not valid without an email" do
    user = User.new(name: "John Doe")
    expect(user).not_to be_valid
  end

  it "is not valid without an password" do
    user = User.new(password: "123456")
    expect(user).not_to be_valid
  end

end
