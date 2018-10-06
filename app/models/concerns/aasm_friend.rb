module AasmFriend
  extend ActiveSupport::Concern
  included do
    include AASM
    include AasmHistory
    aasm do
      state :requested, initial: true # 申請中
      state :rejected # 拒否
      state :approved # 承認
      state :goodbye # 登録解除

      event :reject do
        transitions from: :requested, to: :rejected
      end

      event :approve do
        transitions from: :requested, to: :approved
      end

      event :bye do
        transitions from: :approved, to: :goodbye
      end
    end

    # aasm_fired(historyを作るメソッド)をrun, run!の形にも対応させたい
    # aasm.events.map(&:name).each do |method_name|
    #   define_method method_name, instance_method(:fire)
    #   define_method "#{method_name.to_s}!".to_sym, instance_method(:fire!)
    # end

    # この使い方のみ有効にする
    # job.aasm.fire(:run) # not saved
    # job.aasm.fire!(:run) # saved
    # job.run # not saved ✕
    # job.run! # saved ✕
    #
  end
end
