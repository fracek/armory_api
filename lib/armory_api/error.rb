module ArmoryApi
  # Custom error class for rescuing from all Armory errors
  class Error < StandardError; end

  # Raised when the Armory returned a 404 status code
  class NotFound < Error; end

  # Raised when the Armory return a 500 status code
  class InternalServerError < Error; end

  # Raised when the realm is not set
  class RealmNotFound < Error; end
end
