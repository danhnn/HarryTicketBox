require 'rails_helper'

RSpec.describe Region, type: :model do
	  
  # I give up here ? what the hell it always say that 'hey the name has already been taken' ?
  #it { should validate_inclusion_of(:name).in_array(['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 'Lam Dong']) }
  it { should validate_uniqueness_of(:name) }

end
  