# Mandrill-Rails-Demo

A quick demo app showing the basic usage of the
[Mandrill::Rails](https://github.com/evendis/mandrill-rails)
gem in a Rails 4 application.

Not much to see here yet..

## Up and running...

After you've cloned the repo, simply:

```
bundle
rake db:migrate
rails s
```

## hard_bounce test

With your local server running on http://localhost:3000, run this script that uses curl to send a hard_bounce event:

```
bin/poke_hard_bounce_event
```

In the rails server window you should see output like this:

```
Started POST "/webhook" for ::1 at 2015-10-14 00:41:30 +0800
Processing by WebhookController#create as */*
  Parameters: {"mandrill_events"=>"[{\"event\":\"hard_bounce\",\"_id\":\"1dbc399ff23847f1a7bd5bcc047b3089\",\"msg\":{\"ts\":142780085,\"_id\":\"1dbc399ff23847f1a7bd5bcc047b3089\",\"state\":\"bounced\",\"subject\":\"[subject]\",\"email\":\"example@example.org\",\"tags\":[\"tag\"],\"smtp_events\":[{\"ts\":1427800855,\"type\":\"sent\",\"diag\":\"250 2.0.0 OK 1427800855 s44si7119005yho.99 - gsmtp\",\"source_ip\":\"198.2.128.3\",\"destination_ip\":\"64.233.177.26\",\"size\":19486}],\"resends\":[],\"_version\":\"n7ryzhjgtNQ7iu-681TS9g\",\"diag\":\"X-Postfix; unknown user: \\\"[removed_email]\",\"bgtools_code\":10,\"metadata\":{\"person\":314911,\"activity\":17351,\"attendee\":410289},\"sender\":\"[fromemail]\",\"template\":null,\"bounce_description\":\"bad_mailbox\"},\"ts\":1427801665}]"}

MANDRILL EVENT HANDLER: HARD BOUNCE
payload: Mandrill::WebHook::EventDecorator
{
  "event": "hard_bounce",
  "_id": "1dbc399ff23847f1a7bd5bcc047b3089",
  "msg": {
    "ts": 142780085,
    "_id": "1dbc399ff23847f1a7bd5bcc047b3089",
    "state": "bounced",
    "subject": "[subject]",
    "email": "example@example.org",
    "tags": [
      "tag"
    ],
    "smtp_events": [
      {
        "ts": 1427800855,
        "type": "sent",
        "diag": "250 2.0.0 OK 1427800855 s44si7119005yho.99 - gsmtp",
        "source_ip": "198.2.128.3",
        "destination_ip": "64.233.177.26",
        "size": 19486
      }
    ],
    "resends": [

    ],
    "_version": "n7ryzhjgtNQ7iu-681TS9g",
    "diag": "X-Postfix; unknown user: \"[removed_email]",
    "bgtools_code": 10,
    "metadata": {
      "person": 314911,
      "activity": 17351,
      "attendee": 410289
    },
    "sender": "[fromemail]",
    "template": null,
    "bounce_description": "bad_mailbox"
  },
  "ts": 1427801665
}
Completed 200 OK in 1ms (ActiveRecord: 0.0ms)

```
