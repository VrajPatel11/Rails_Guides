#Attaching Files to Records

#has_one attached
#it sets up one-to-one mapping between records and files.
class User < ApplicationRecord
    has_one_attached :avatar
end

#has_many attached
#it sets up one-to-many relationship between records and files.
class Message < ApplicationRecord
    has_many_attached :images
end

#attaching file i/o objects

@message.image.attach(io: File.open('/path/to/file'), filename: 'file.pdf')
#it will attach the file from our disk

@message.image.attach(
    io: File.open('/path/to/file'),
    filename: 'file.pdf',
    content_type: 'application/pdf',
    identify: false
)
#to bypass file's content type from the data
    
  