# frozen_string_literal: true

module CastleDevise
  mattr_accessor :logger
  @@logger = Rails.logger
end

require_relative 'castle_devise/rails'
require_relative 'castle_devise/patches'
require_relative 'castle_devise/controllers/helpers'
require_relative 'castle_devise/hooks/castle_protectable'
require_relative 'castle_devise/models/castle_protectable'
require_relative 'castle_devise/patches/registrations_controller'

Devise.add_module :castle_protectable, model: 'castle_devise/models/castle_protectable'
