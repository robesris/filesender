require 'spec_helper'

describe "/ul_files/show.html.erb" do
  include UlFilesHelper
  before(:each) do
    assigns[:ul_file] = @ul_file = stub_model(UlFile,
      :sender_name => "value for sender_name",
      :recipient_email => "value for recipient_email",
      :filename => "value for filename"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ sender_name/)
    response.should have_text(/value\ for\ recipient_email/)
    response.should have_text(/value\ for\ filename/)
  end
end
