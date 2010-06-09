class FileMailer < ActionMailer::Base
  def file_notification(options)
    url = File.join("http://", options[:host_with_port], options[:url])

    recipients    options[:recipients]
    from          options[:from]
    subject       "You have been sent a file!"
    body          "#{options[:sender]} has sent you a file.  Click the link below to download it.<br/><br/>" + 
                  "<a href=\"#{url}\">#{options[:filename]}</a>"
    content_type  "text/html"
  end
end
