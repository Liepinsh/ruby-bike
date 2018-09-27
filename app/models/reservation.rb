class Reservation < ApplicationRecord
    belongs_to :employee
    belongs_to :bike
    
    validate :time
    # validate :biko
    # validate :takens

    validate :bikers, if: -> { bike.ride.present?}

    def bikers
        errors.add(:bike_id, 'Result cannot be tie!') if  Bike.where(bike: self) == bike.ride
    end

    def taken
        if bike.ride.include? "false"
            show_time
        else
            "It's available"
        end
    end

    def show_time
        "#{from} - #{till}"
    end

    def time
        if from == till
            errors.add(:till, "and From can't be the same")
        end
    end

    # def biko
    #     if bike.ride.where(bike: self).size > 0
    #         errors.add(:bike_id, "is reserved. Pick another one or wait from #{from} till #{till} #{bike_id}")
    #     end
    # end

    # def takens
    #     if bike.ride.include? "false"
    #         errors.add(:bike_id, "is reserved. Pick another one or wait from #{from} till #{till} #{bike_id} ")
    #     end
    # end
end

    

# class Reservation < ApplicationRecord
#     belongs_to :employee
#     belongs_to :bike

#     def taken
#         if ride.include? "false"
#             show_time
#         end
#     end

#     def show_time
#         "#{from} - #{till}"
#     end
# end

# def takens
#     if bike.ride.include? "false"
#         errors.add(:bike_id, "is reserved. Pick another one or wait from #{from} till #{till} ")
#     end
# end

# def takens
#     if bike.ride == @reservations.reservation.bike.ride
#         errors.add(:bike_id, "is reserved. Pick another one or wait from #{from} till #{till} ")
#     end
# end

# def takens
#     if bike.ride == reservation.bike.ride
#         errors.add(:bike_id, "is reserved.")
#     end
# end

# def takens
#     if bike_id == 2
#         errors.add(:bike_id, "sdddddddddddd")
#     end
# end

# def taken
#     if bike.ride.include? "false"
#         show_time
#     end
# end

# def taken
#     if bike_id.value == "Bee false"
#         errors.add(:bike_id, "and Guest score can't be the same")        end
#     end
# end