class Employee < ApplicationRecord
    def full_name
        "#{name} #{surname}"
    end
end
