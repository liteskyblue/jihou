require 'slack-notifier'
require 'dotenv'
# ENV['DEV'] に値がある場合にDotenv を有効化
Dotenv.load if ENV['DEV']

# メッセージをrandom チャンネルに通知
def notify(message)
  notifier = Slack::Notifier.new(
    ENV["SLACK_INCOMING_WEBHOOK"],
    channel: "random",
    username: 'jihoh bot',
    icon_url: ENV['ICON_URL']
  )
  notifier.ping(message)
end

# (DateTime.to_time + 1.hours).to_datetime


def jihoh
  now = Time.now
  # 10 分単位でスケジューラ実行が組まれているので、その時間内で時間内で実行される時間帯を設定する
  minutes_between = (50..59)
  
  # return unless minutes_between.include?(now.min)

  message = "✂----- #{Time.at(now.to_i + 60 * 60).hour}:00 くらいになったぞい ------✂"
  notify(message)
end

jihoh