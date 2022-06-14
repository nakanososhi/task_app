class User < ApplicationRecord
  validates :title, presence: true
  validates :start, presence: true
  validates :stop, presence: true
  validates :memo, length: {maximum: 30}

  default_scope -> {order(updated_at: :desc) }

  validates :stop, inclusion: { in: ->(_record) { Time.current.tomorrow.to_date.. }, message: 'に今日以前の日は登録できません' }
end
