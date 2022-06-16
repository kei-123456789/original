require 'rails_helper'

RSpec.describe "Contents", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @content = FactoryBot.create(:content)
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
