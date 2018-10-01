class Reservation < ApplicationRecord
    belongs_to :employee
    belongs_to :bike
    
    validate :time

    def time
        if starting == till
            errors.add(:till, "and Starting can't be the same")
        end
    end

    validate :availability 

    def availability
        if Reservation.where(bike_id: self.bike_id).where("starting < ?", self.starting).where("till >= ?", self.starting).size > 0 ||
            Reservation.where(bike_id: self.bike_id).where("starting < ?", self.till).where("till >= ?", self.till).size > 0
    
            errors.add(:bike_id, "#{bike.name} is not available at this time")
        end
    end
end