class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:patient, :doctor, :admin]

  has_many :appointments, foreign_key: 'patient_id'

end

