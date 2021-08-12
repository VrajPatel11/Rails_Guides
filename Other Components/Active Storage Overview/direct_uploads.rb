#Direct Uploads

#include activestorage.js in application's JavaScript bundle then add direct_upload: true
#<%= form.file_field :attachments, multiple: true, direct_upload: true %>
#OR
#<input type=file data-direct-upload-url="<%= rails_direct_uploads_url %>" />
#in case of no FormBuilder

#then configure CORS on third-party storage services

#allow
# All origins from which your app is accessed
# The PUT request method
# The following headers:
# Origin
# Content-Type
# Content-MD5
# Content-Disposition (except for Azure Storage)
# x-ms-blob-content-disposition (for Azure Storage only)
# x-ms-blob-type (for Azure Storage only)

