class Diet < ApplicationRecord
    belongs_to :user

    validates :goal, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :current_weight, presence: true
    validates :target_weight, presence: true
    validates :activity_level, presence: true
    
end