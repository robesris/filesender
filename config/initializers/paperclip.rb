# adds ':md5' as a placeholder for Paperclip paths, which is an md5 hash of the file's name
Paperclip.interpolates :md5 do |attachment, style|
  Digest::MD5.hexdigest(attachment.instance.attachment_file_name)
end