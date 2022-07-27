#!/bin/bash

client_id=$(jq -r '.installed.client_id' credentials.json)
client_secret=$(jq -r '.installed.client_secret' credentials.json)
timestamp=$(date +%s%N | cut -b1-13)

checkToken() {
  token_file=./token.json
  if test -f "$token_file"; then
    access_token=$(jq -r '.access_token' token.json)
    refresh_token=$(jq -r '.refresh_token' token.json)
    expiry_date=$(jq -r '.expiry' token.json)

    echo "$token_file exists. checking expirydate"
    if [ $expiry_date -lt $timestamp ]; then
      refreshToken
    else
      echo "token OK"
    fi
  else
    echo "token not found. Initiating authorization"
    authorize
  fi
  getEvents
}

authorize() {
  echo "Authorize this app by visiting this url:"
  echo "https://accounts.google.com/o/oauth2/v2/auth?client_id=$client_id&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/calendar.events&response_type=code"
  read -p "Enter the code from that page here: " authcode
  curl -s \
    --request POST \
    --data "code=$authcode&client_id=$client_id&client_secret=$client_secret&redirect_uri=urn:ietf:wg:oauth:2.0:oob&grant_type=authorization_code" \
    https://accounts.google.com/o/oauth2/token >token.json
  expiry=$(date +%s%N --date="+3599 seconds" | cut -b1-13)
  token_file=$(jq .expiry=$expiry ./token.json)
  echo $token_file >token.json

  checkToken
}

refreshToken() {
  echo "REFRESHING TOKEN"
  curl -s \
    --request POST \
    --data "client_id=$client_id&client_secret=$client_secret&refresh_token=$refresh_token&grant_type=refresh_token" \
    https://accounts.google.com/o/oauth2/token >token.json
  expiry=$(date +%s%N --date="+3599 seconds" | cut -b1-13)
  token_file=$(jq .expiry=$expiry ./token.json)
  echo $token_file >token.json
}

getEvents() {
  events=$(curl -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $access_token" \
    "https://www.googleapis.com/calendar/v3/calendars/primary/events?maxResults=10&orderBy=startTime&singleEvents=true&timeMin=2022-05-18T10%3A00%3A00-07%3A00&prettyPrint=true&fields=items%2Fsummary%2Citems%2Fstart%2C%20items%2FhangoutLink&access_key=$access_token")

  MEETS=$(echo "$events" | jq -r '.items[] | .start.dateTime + " | " + .summary + " | " + .hangoutLink' | while read event; do echo $event; done)
  MEET=$(printf '%s\n' "${MEETS[@]}" | rofi -dmenu -font "lato 18" -i -p "Join Meeting:")

  URL=$(cut -d "|" -f3 <<<$MEET)
  if [ "$URL" ]; then
    google-chrome --new-window $URL
  else
    echo "Program terminated." && exit 1
  fi
}

checkToken
