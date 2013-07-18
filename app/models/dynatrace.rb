class OtherDatabase < ActiveRecord::Base
        self.abstract_class = true
        establish_connection "other_#{Rails.env}"
end

class Dynatrace < OtherDatabase
      self.table_name = 'dynatrace'
end