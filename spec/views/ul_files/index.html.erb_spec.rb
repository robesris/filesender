require 'spec_helper'

describe "/ul_files/index.html.erb" do
  include UlFilesHelper

  before(:each) do
    assigns[:ul_files] = [
      stub_model(UlFile,
        :sender_name => "value for sender_name",
        :recipient_email => "value for recipient_email",
        :filename => "value for filename"
      ),
      stub_model(UlFile,
        :sender_name => "value for sender_name",
        :recipient_email => "value for recipient_email",
        :filename => "value for filename"
      )
    ]
  end

  it "renders a list of ul_files" do
    render
    response.should have_tag("tr>td", "value for sender_name".to_s, 2)
    response.should have_tag("tr>td", "value for recipient_email".to_s, 2)
    response.should have_tag("tr>td", "value for filename".to_s, 2)
  end
end
