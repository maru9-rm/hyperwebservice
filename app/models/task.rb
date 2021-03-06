# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  command    :boolean
#  content    :text
#  status     :integer          default("not_yet"), not null
#  subject    :integer          default("other"), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
class Task < ApplicationRecord
    belongs_to :user

    enum subject: { other: 0, japanese: 1, math: 2, socialstudy: 3, science: 4, english: 5 }
    enum status: { not_yet: 0, done: 1, over: 2 }
end
