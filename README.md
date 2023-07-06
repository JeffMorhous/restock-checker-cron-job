# Ruby Cron Job

This is a simple Ruby cron job example for [Render](https://render.com).

## Deployment

Fork this repo on Render and create a new **Cron Job** using your new repo and the following values:

   | Field      |  Value    |
   | ---------- | --------- |
   | **Environment** | `Ruby` |
   | **Build Command** | `bundle install` |

Set the schedule to run your command once every ten minutes. See [cron expressions](https://en.wikipedia.org/wiki/Cron#CRON_expression) for the schedule format.

   | Field      | Value                      |
   |----------------------------| --------- |
   | **Schedule** | `*/10 * * * *`             |
   | **Command** | `bundle exec ruby main.rb` |


## ENV Variables:

You must set:

TWILIO_ACCOUNT_SID (from Twilio Dashboard)
TWILIO_AUTH_TOKEN (from Twilio Dashboard)
FROM_NUMBER (from Twilio Dashboard)
TO_NUMBER (where you want the notification sent)
