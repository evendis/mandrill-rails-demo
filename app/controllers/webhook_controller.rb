class WebhookController < ApplicationController
  include Mandrill::Rails::WebHookProcessor
  unhandled_events_raise_exceptions!

  def handle_hard_bounce(event_payload)
    @handled_event = event_payload
    logger.info "\nMANDRILL EVENT HANDLER: HARD BOUNCE"
    logger.info "payload: #{event_payload.class.name}"
    logger.info JSON.pretty_generate event_payload
    logger.info event_payload.to_s
  end

end