class WebhookController < ApplicationController
  include Mandrill::Rails::WebHookProcessor

  # To completely ignore unhandled events (not even logging), uncomment this line
  # ignore_unhandled_events!

  # If you want unhandled events to raise a hard exception, uncomment this line
  unhandled_events_raise_exceptions!

  # To enable authentication, uncomment this line and set your API key.
  # It is recommended you pull your API keys from environment settings,
  # or use some other means to avoid committing the API keys in your source code.
  # authenticate_with_mandrill_keys! 'YOUR_MANDRILL_WEBHOOK_KEY'

  def handle_hard_bounce(event_payload)
    @handled_event = event_payload
    logger.info "\nMANDRILL EVENT HANDLER: HARD BOUNCE"
    logger.info "payload: #{event_payload.class.name}"
    logger.info JSON.pretty_generate event_payload
  end
end