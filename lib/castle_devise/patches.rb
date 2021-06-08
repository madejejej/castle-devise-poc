# frozen_string_literal: true

module CastleDevise
  module Patches
    class << self
      def apply
        Devise::RegistrationsController.send(:include, Patches::RegistrationsController)

        Rails.logger.info "Devise patches with CastleDevise"
      end
    end
  end
end