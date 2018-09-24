module AasmOffer
  extend ActiveSupport::Concern
  included do
    include AASM
    include AasmHistory
    aasm do
      state :candidate, initial: true # 候補
      state :offering # オファー中
      state :ng # ng
      state :ok # 決定
      state :cancel # イベントキャンセル

      # todo エベント定義する
      # event :request do
      #   transitions from: :prepared, to: :judging
      #   transitions from: :denied, to: :judging
      # end
      #
    end
  end
end
