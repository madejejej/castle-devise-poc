# frozen_string_literal: true

module CastleDevise
  module Helpers
    module CastleHelper
      def castle_javascript_tag
        javascript_include_tag(
          "https://d2t77mnxyo7adj.cloudfront.net/v1/c.js?#{CastleDevise.configuration.app_id}"
        )
      end
    end
  end
end