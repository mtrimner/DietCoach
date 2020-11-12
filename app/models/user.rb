class User < ApplicationRecord
  has_many :foods
  has_many :meals, through: :foods
  has_one :diet 
  has_one :user_stat

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user | 
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end


  ACTIVITY_LEVEL = {
    1 => 1.2,
    2 => 1.375,
    3 => 1.55,
    4 => 1.725,
    5 => 1.9
}

def total_energy_expenditure
  (calculate_bmr * ACTIVITY_LEVEL[self.diet.activity_level]).floor
end


  private

  def calculate_bmr
    if self.user_stat.sex == "Male"
      ((4.536 * self.diet.current_weight) + (15.88 * self.user_stat.height_inches) - (5 * user_age) + 5)
    else 
      ((4.536 * self.diet.current_weight) + (15.88 * self.user_stat.height_inches) - (5 * user_age) - 161)
    end
  end

  def user_age
    ((Time.zone.now - self.user_stat.birthday.to_time) / 1.year.seconds).floor
  end

end
