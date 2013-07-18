module ResultHelper
        
        def  change_time_style(period, interval)
               return period.split(":").first + " " +((period.split(":").last.to_i-1) * interval.to_i).to_s + ":00:00-" +  ((period.split(":").last.to_i) * interval.to_i).to_s+":00:00"
        end
        
end
