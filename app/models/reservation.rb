class Reservation < ApplicationRecord
    belongs_to :employee
    belongs_to :bike
    
    validate :time

    def time
        if starting == till
            errors.add(:till, "and From can't be the same")
        end
    end

    # validate :availability 

    # def availability
    #     if Bike.where(bike_id: self.bike_id).where("starting <= ?", self.starting).where("till >= ?", self.starting).size > 0 ||
    #         Bike.where(bike_id: self.bike_id).where("starting <= ?", self.till).where("till >= ?", self.till).size > 0
    
    #         errors.add(:bike_id, "Bike is not available at this time")
    #     end
    # end

    # def availability
    #     if Bike.where(bike: self).where("starting <= ?", self.starting).where("till >= ?", self.starting).size > 0 ||
    #         Bike.where(bike, self.bike).where("starting <= ?", self.till).where("till >= ?", self.till).size > 0

    #         errors.add(:bike_id, "Bike is not available at this time")
    #     end
    # end
end