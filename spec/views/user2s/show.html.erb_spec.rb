require 'rails_helper'

RSpec.describe "user2s/show", :type => :view do
  before(:each) do
    @user2 = assign(:user2, User2.create!(
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
