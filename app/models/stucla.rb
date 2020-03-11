class Stucla < ActiveRecord::Base
    has_many :assignments
    has_many :students, ->{distinct}, through: :assignments
end
