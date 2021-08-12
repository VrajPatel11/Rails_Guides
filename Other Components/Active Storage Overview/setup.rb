#Setup

local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

test:
  service: Disk
  root: <%= Rails.root.join("tmp/storage") %>

amazon:
  service: S3
  access_key_id: ""
  secret_access_key: ""
  bucket: ""
  region: "" # e.g. 'us-east-1'

# Store files locally.
config.active_storage.service = :local

# Store files on Amazon S3.
config.active_storage.service = :amazon

# Store uploaded files on the local file system in a temporary directory.
config.active_storage.service = :test


#Disk Service
#local:
#  service: Disk
#  root: <%= Rails.root.join("storage") %>
#declare a serivce in config/storage.yml

#S3 Service
#to connect amazon s3, declare it in config/storage.yml
amazon:
  service: S3
  access_key_id: ""
  secret_access_key: ""
  region: ""
  bucket: ""

#Microsoft Azure Storage Service
azure:
  service: AzureStorage
  storage_account_name: ""
  storage_access_key: ""
  container: ""
#and add the above in Gemfile
gem "azure-storage-blob", require: false


#Google Cloud Storage Service
# google:
#   service: GCS
#   credentials: <%= Rails.root.join("path/to/keyfile.json") %>
#   project: ""
#   bucket: ""
#and add the gem to Gemfile
gem "google-cloud-storage", "~> 1.11", require: false
