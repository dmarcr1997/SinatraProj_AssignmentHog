class Student < ActiveRecord::Base
    has_secure_password
    has_many :assignments
    has_many :stuclas, ->{distinct}, through: :assignments
    has_many :messages
end