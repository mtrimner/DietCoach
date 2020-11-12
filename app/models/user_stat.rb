class UserStat < ApplicationRecord
    belongs_to :user
    validates :sex, presence: true
    validates :height_inches, presence: true
    validates :birthday, presence: true

end