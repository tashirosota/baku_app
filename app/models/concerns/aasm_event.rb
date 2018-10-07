module AasmEvent
  extend ActiveSupport::Concern
  included do
    include AASM
    include AasmHistory
    aasm do
      state :plan, initial: true # 構想段階
      state :before_offered # オファー前
      state :offering # オファー中
      state :fixed # 締め
      state :finished # イベント終了

      event :list do
        transitions from: :plan, to: :before_offered
      end

      event :offer do
        transitions from: :before_offered, to: :offering
      end

      event :fix do
        transitions from: :offering, to: :fixed
      end

      event :finish do
        transitions from: :fixed, to: :finished
      end
    end
  end
end
