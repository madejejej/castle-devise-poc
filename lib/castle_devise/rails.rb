# frozen_string_literal: true

ActiveSupport.on_load(:action_controller) do
  include CastleDevise::Controllers::Helpers
end

ActiveSupport::Reloader.to_prepare do
  CastleDevise::Patches.apply
end