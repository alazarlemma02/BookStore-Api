require 'rails_helper'

RSpec.describe Category, type: :model do
  attributes =[
    {name: %i[presence uniqueness]},
    {book: :have_many}


  ]
  include_examples("model_shared_spec",:category, attributes)
  describe "validate category name length" do

    it{is_expected.to(validate_length_of(:name).is_at_least(3))}
  end
end
