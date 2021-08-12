#Linking to Files

#generate a permanent url
url_for(user.avatar)

#for creatig a download link
rails_blob_path(user.avatar, disposition: "attachment")


#Downloading Files

binary = user.avatar.download
#read a blob's binary data into memory

message.video.open do |file|
    system '/path/to/virus/scanner', file.path
    # ...
end  
#download blob to a tempfile on disk so that virus scanner or media transcoder can operate on it



#Analyzing Files
#Active Storage analyzes files once they've been uploaded by queuing a job in Active Job. Analyzed files will store additional information in the metadata hash, including analyzed: true.


#Transforming Images

#use variant to create a avrian of an image, when browser hits variant url, Active Storage will transform original blob into specefied format and redirect to new service location
#<%= image_tag user.avatar.variant(resize_to_limit: [100, 100]) %>


#Previewing Files
<ul>
  <% @message.files.each do |file| %>
    <li>
      <%= image_tag file.preview(resize_to_limit: [100, 100]) %>
    </li>
  <% end %>
</ul>
#to preview non image files


