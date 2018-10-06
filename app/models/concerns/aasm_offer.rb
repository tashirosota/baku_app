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
      state :canceled # イベントキャンセル

      event :offer do
        transitions from: :candidate, to: :offering
      end

      event :approve do
        transitions from: :offering, to: :ok
      end

      event :reject do
        transitions from: :offering, to: :ng
      end

      event :cancel do
        transitions from: :ok, to: :canceled
      end
    end
  end
end
