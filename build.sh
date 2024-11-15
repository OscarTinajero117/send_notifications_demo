#!/bin/bash
mix deps.get

export GOOGLE_APPLICATION_CREDENTIALS="/Users/nerus-dev/developer/cloud-messaging/firebase/notifications_demo/notifications-demo-6b259-firebase-adminsdk-ukyqs-e9581e2ad0.json"

iex -S mix phx.server