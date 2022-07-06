# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Message < ApplicationRecord
    validates :content, presence: true
    # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
    after_create_commit { MessageBroadcastJob.perform_later self }
end