import {promises as fs} from 'fs';
import { authenticate } from '@google-cloud/local-auth'
import { google } from 'googleapis';
import moment from 'moment';
// If modifying these scopes, delete token.json.
const SCOPES = ['https://www.googleapis.com/auth/calendar.readonly'];
// The file token.json stores the user's access and refresh tokens, and is
// created automatically when the authorization flow completes for the first
// time.
const PATH = '/home/csaba/.scripts/calnode/';
const TOKEN = PATH + 'token.json';
const CREDENTIALS = PATH + 'credentials.json';
/**
 * Reads previously authorized credentials from the save file.
 *
 * @return {Promise<OAuth2Client|null>}
 */
async function loadSavedCredentialsIfExist() {
    try {
        const content = await fs.readFile(TOKEN);
        const credentials = JSON.parse(content);
        return google.auth.fromJSON(credentials);
    } catch (err) {
        console.error('error: ',err)
        return null;
    }
}

  /**
   * Serializes credentials to a file comptible with GoogleAUth.fromJSON.
   *
   * @param {OAuth2Client} client
   * @return {Promise<void>}
   */
async function saveCredentials(client) {
    const content = await fs.readFile(CREDENTIALS);
    const keys = JSON.parse(content);
    const key = keys.installed || keys.web;
    const payload = JSON.stringify({
        type: 'authorized_user',
        client_id: key.client_id,
        client_secret: key.client_secret,
        refresh_token: client.credentials.refresh_token,
    });
    await fs.writeFile(TOKEN, payload);
}
  
  /**
   * Load or request or authorization to call APIs.
   *
   */
async function authorize() {
    let client = await loadSavedCredentialsIfExist();
    if (client) return client;

    client = await authenticate({
        scopes: SCOPES,
        keyfilePath: CREDENTIALS,
    });
    if (client.credentials) {
        await saveCredentials(client);
    }
    return client;
}

function listEvents(auth) {
  const calendar = google.calendar({ version: 'v3', auth });
  const dateFormat = 'D.M H:mm';
  calendar.events.list(
    {
      calendarId: 'primary',
      timeMin: new Date().toISOString(),
      maxResults: 10,
      singleEvents: true,
      orderBy: 'startTime',
    },
    (err, res) => {
      if (err) {
        console.log('The API returned an error: ' + err);
        fs.unlink(TOKEN, function (err) {
          if (err) throw err;
          // if no error, file has been deleted successfully
          console.log('Token expired. Try again!');
        });
        return
      }
      const events = res.data.items;
      if (events.length) {
        events.map((event, i) => {
          let start =
            moment(event.start.dateTime).format(dateFormat) ||
            moment(event.start.date).format(dateFormat);
          console.log(
            start +
              ' | ' +
              event.summary +
              ' | ' +
              (event.hangoutLink ? event.hangoutLink : '-')
          );
        });
      } else {
        console.log('No upcoming events found.');
      }
    }
  );
}

await authorize().then(listEvents).catch(console.error);
