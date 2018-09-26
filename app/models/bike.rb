class Bike < ApplicationRecord
    def ride
        "#{name} #{available}"
    end
end
