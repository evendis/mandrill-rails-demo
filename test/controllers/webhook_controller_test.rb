require 'test_helper'

class WebhookControllerTest < ActionController::TestCase

  test "responds to GET" do
    get :show
    assert_response :success
  end

  test "handles a hard_bounce succesfully" do
    hard_bounce_event = {"event"=>"hard_bounce", "_id"=>"1dbc399ff23847f1a7bd5bcc047b3089", "msg"=>{"ts"=>142780085, "_id"=>"1dbc399ff23847f1a7bd5bcc047b3089", "state"=>"bounced", "subject"=>"[subject]", "email"=>"example@example.org", "tags"=>["tag"], "smtp_events"=>[{"ts"=>1427800855, "type"=>"sent", "diag"=>"250 2.0.0 OK 1427800855 s44si7119005yho.99 - gsmtp", "source_ip"=>"198.2.128.3", "destination_ip"=>"64.233.177.26", "size"=>19486}], "resends"=>[], "_version"=>"n7ryzhjgtNQ7iu-681TS9g", "diag"=>"X-Postfix; unknown user: \"[removed_email]", "bgtools_code"=>10, "metadata"=>{"person"=>314911, "activity"=>17351, "attendee"=>410289}, "sender"=>"[fromemail]", "template"=>nil, "bounce_description"=>"bad_mailbox"}, "ts"=>1427801665}
    post :create, mandrill_events: [hard_bounce_event].to_json
    assert_response :success
    assert_not_nil assigns(:handled_event)
  end
end
