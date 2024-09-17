class User < ApplicationRecord

    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validate_fields = Proc.new do |field, additional_validation = {}|
        validates field, presence: true, **additional_validation
    end

    validate_fields.call(:email, { format: {with: VALID_EMAIL_REGEX}})
    validate_fields.call(:username)
    validate_fields.call(:name)

end
