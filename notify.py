import telegram
import sys

telegram_http_api = "1706194653:AAGnVCJa9lizF5ATB22Z-dFcZJos93irlSU"
telegram_user_id = "1769755104"

message = "NFI Repo Updated \n\n " + str(sys.argv[1]) + "\n\n"

bot_binance = telegram.Bot(token=telegram_http_api)
bot_binance.send_message(chat_id=telegram_user_id, text=message)
