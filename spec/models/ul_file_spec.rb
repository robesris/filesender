require 'spec_helper'

describe UlFile do
  before(:each) do
    @valid_attributes = {
      :sender_name => "value for sender_name",
      :recipient_email => "value for recipient_email",
      :filename => "value for filename"
    }
  end

  it "should create a new instance given valid attributes" do
    UlFile.create!(@valid_attributes)
  end
end
