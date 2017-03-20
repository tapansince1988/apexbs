class Option < ApplicationRecord

  belongs_to :user

  title_regex = /\A[ a-zA-Z.']+\z/

  validates :title,
            :presence => true,
            :length => {maximum: 100},
            :format => {with: title_regex}

  validates :stock_price,
            :presence => true,
            :numericality => true

  validates :strike_price,
            :presence => true,
            :numericality => true

  validates :time,
            :presence => true,
            :numericality => {:only_integer => true, :greater_than => 0, :less_than => 16, :message => "Time of maturity must be between 1 to 15 yrs"}

  validates :volatility,
            :presence => true,
            :numericality => true

  validates :risk_free_rate,
            :presence => true,
            :numericality => true

end
