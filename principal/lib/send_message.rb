# frozen_string_literal: true

class SendMessage
  def self.slack_notifier(msg)
    require 'slack-notifier'
    notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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'
    notifier.ping msg
  end
end
