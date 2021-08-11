#Supported Types For Arguments

#GlobalID

#We can pass live Active Record objects to our job
class TrashableCleanupJob < ApplicationJob
    def perform(trashable, depth)
      trashable.cleanup(depth)
    end
end


#Serializers
#define our own serializer
class MoneySerializer < ActiveJob::Serializers::ObjectSerializer
  # Checks if an argument should be serialized by this serializer.
  def serialize?(argument)
    argument.is_a? Money
  end

  # Converts an object to a simpler representative using supported object types.
  # The recommended representative is a Hash with a specific key. Keys can be of basic types only.
  # You should call `super` to add the custom serializer type to the hash.
  def serialize(money)
    super(
      "amount" => money.amount,
      "currency" => money.currency
    )
  end

  # Converts serialized value into a proper object.
  def deserialize(hash)
    Money.new(hash["amount"], hash["currency"])
  end
end

#add serializer to it
Rails.application.config.active_job.custom_serializers << MoneySerializer
