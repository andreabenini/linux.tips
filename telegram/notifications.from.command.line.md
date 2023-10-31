# Send telegram notifications

## Create a Telegram bot
- Find @BotFather
- Type `/start` or press **"Start"** button (on Desktop application)
- Create a new bot (`/newbot`) or edit an existing one (`/mybots`)
- Edit a suitable name for the bot or supply a previously existing one
- Specify a username for the bot, it must end with _"bot"_

## Channel setup for your bot
- A channel can be created through the App easily, no matter if the desktop or mobile version
- Provide user rights to the bot for the specified channel (admin perms are not needed)
- Post a dummy message to the channel as a regular user in order to get the ChannelID
- Detect and save the Channel ID, something like this might help:  
    `curl 'https://api.telegram.org/bot<BotToken>/getUpdates'`
- Channel ID is in the json message, see this JSON stream
    ```json
    {
        "ok": true,
        "result": [
            {
                "update_id": 123456789,
                "channel_post": {
                    "message_id": 3,
                    "sender_chat": {            // 'sender_chat' might be present or not
                        "id": -9234567890123,
                        "title": "This is the channel name you defined",
                        "type": "channel"
                    },
                    "chat": {                   // Use this information for channel Info
                        "id": -9234567890123,   // THIS is your Channel ID
                        "title": "This is the channel name you defined",
                        "type": "channel"
                    },
                    "date": 1346613456,
                    "text": "channel service message"
                }
            }
        ]
    }
    ```

## Usage examples
- Get channel information or updates
    ```sh
    curl 'https://api.telegram.org/bot<BotToken>/getUpdates'
    ```
- Send a message:  
    ```sh
    # oneliner
    curl 'https://api.telegram.org/bot<Token>/sendMessage?chat_id=<ChannID>&text=<Msg>'
    # or
    MSG="Here is your message"
    CHANNEL_ID="YourChannelID"
    BOT_TOKEN="YourBotTokenGoesHere"
    curl -s --data "text=$MSG" --data "chat_id=$CHANNEL_ID"\
         'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage'
    ```
