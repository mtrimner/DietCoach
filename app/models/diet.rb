class Diet < ApplicationRecord
    belongs_to :user
    validates :goal, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :current_weight, presence: true, numericality: true
    validates :target_weight, presence: true, numericality: true
    validates :activity_level, presence: true
    

    def daily_calorie_variance
        (calculate_weight_change * 3500).floor / Integer(self.end_date - self.start_date)
    end
        
    def calculate_weight_change
        if self.goal == "lose"
          self.current_weight - self.target_weight
        elsif self.goal == "build"
          self.target_weight - self.current_weight
        else 
          0
        end
    end    
end