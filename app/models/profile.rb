# == Schema Information
#
# Table name: profiles
#
#  id              :bigint           not null, primary key
#  birthday        :date
#  club            :string
#  long_term_goal  :string
#  memo            :text
#  short_term_goal :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
    belongs_to :user
end
