class WpDynaSummary < ActiveRecord::Base
  attr_accessible :belong_period, :fullload_average, :fullload_best, :fullload_worst, :impression_average, :impression_best, :impression_worst, :onload_average, :onload_best, :onload_worst, :render_average, :render_best, :render_worst, :network_average, :network_best, :network_worst, :url, :summary_count
end
