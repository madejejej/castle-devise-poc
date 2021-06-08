# frozen_string_literal: true

module CastleDevise
  module Patches
    module RegistrationsController
      extend ActiveSupport::Concern

      included do
        before_action :castle_filter, only: :create
      end

      def castle_filter
        logger.info "Sending request to castle"

        response = castle.filter(
          event: '$registration',
          request_token: params['castle_request_token'],
          context: {
            ip: request.remote_ip,
            headers: Castle::Headers::Filter.new(request).call
          }
        )
        logger.info "Castle response: #{response}"

        if response[:risk] >= 0.9
          flash[:error] = "Account cannot be created at this moment. Please try again later"
          redirect_to new_session_path(resource_name)
          return false
        end
      rescue Castle::Error => e
        # log API errors and allow
        logger.info e
      end
    end
  end
end