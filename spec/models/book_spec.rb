require 'rails_helper'

RSpec.describe Book, type: :model do
  attributes =[
    {title: :presence},
    {author: :presence},
    {category: :belong_to}
  ]
  include_examples("model_shared_spec", :book, attributes)
  it{is_expected.to(validate_length_of(:title).is_at_least(3))}

end
