class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: %w(male female)
  validate :fname_lname_not_null
  validate :not_include_sue
  def fname_lname_not_null
  	if (first_name.nil? && last_name.nil?)
  		errors.add(:base,"need firstname or lastname")
    end
end
  def not_include_sue
    if (gender == "male") && (first_name == "Sue")
    	errors.add(:base,"name not allowed sue")
    end
  end
     min = minimum(:birth_year) 
     max = maximum(:birth_year)

 def self.get_all_profiles(min,max)
  Profile.all.where("birth_year BETWEEN ? AND ?",min,max).order("birth_year ASC")
end

end
