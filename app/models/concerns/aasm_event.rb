module AasmEvent
  extend ActiveSupport::Concern
  included do
    include AASM
    include AasmHistory
    aasm do
      state :plan, initial: true # 構想段階
      state :before_offered # オファー前
      state :offering # オファー中
      state :fixed #締め
      state :finished # イベント終了

      # todo エベント定義する
      # event :request do
      #   transitions from: :prepared, to: :judging
      #   transitions from: :denied, to: :judging
      # end
      #
    end
  end
end
