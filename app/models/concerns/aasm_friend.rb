module AasmFriend
  extend ActiveSupport::Concern
  included do
    include AASM
    include AasmHistory
    aasm do
      state :requested, initial: true # 申請中
      state :rejected # 拒否
      state :approved # 承認
      state :goodbye # さようなら
      state :active # 本登録完了
      state :suspended # 停止中

      # todo エベント定義する
      # event :request do
      #   transitions from: :prepared, to: :judging
      #   transitions from: :denied, to: :judging
      # end
      #
    end

    # usage
    # job = Job.new
    # job.run   # not saved
    # job.run!  # saved
    #
    # # or
    # job.aasm.fire(:run) # not saved
    # job.aasm.fire!(:run) # saved
  end
end
