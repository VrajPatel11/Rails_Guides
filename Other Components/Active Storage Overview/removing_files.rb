#Removing files

#to remove attachment from model, call purge
#purging deletes blob and file from storage service

# Synchronously destroy the avatar and actual resource files.
user.avatar.purge

# Destroy the associated models and actual resource files async, via Active Job.
user.avatar.purge_later
