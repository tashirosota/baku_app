# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_10_031708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "name", comment: "管理者名"
    t.string "password_digest", null: false, comment: "暗号化パスワード"
    t.string "role", comment: "権限% (root admin)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", comment: "アーティスト名"
    t.string "web_url", comment: "サイトurl"
    t.string "genre"
    t.string "mv_urls", comment: "mv(配列で格納)"
    t.string "artist_image", comment: "アー写"
    t.integer "user_id", comment: "登録者id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collaborators", force: :cascade do |t|
    t.integer "user_id", comment: "主催者id"
    t.integer "event_id", comment: "イベントid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title", comment: "タイトル"
    t.date "date", comment: "開催日"
    t.time "open", comment: "オープン時間"
    t.time "start", comment: "スタート時間"
    t.integer "adv", comment: "前売り料金"
    t.integer "door", comment: "当日料金"
    t.text "concept", comment: "コンセプト(概要に組み込む)"
    t.string "images", comment: "フライヤーやタイムテーブルを配列で格納"
    t.string "status", comment: "状態 %(完了 オファー中 構想)"
    t.integer "user_id", comment: "主催者id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "from_user_id", null: false
    t.integer "to_user_id", null: false
    t.string "status", comment: "状態 %(申請中 却下 友達 解除)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "condition", comment: "出演条件"
    t.string "status", comment: "状態%(候補 オファー中 拒否 決定 キャンセル)"
    t.integer "event_id", comment: "イベントid"
    t.integer "artist_id", comment: "アーティストid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", comment: "ユーザ名"
    t.string "avatar", comment: "プロフィール写真"
    t.string "twitter_url", comment: "twitter_url"
    t.string "facebook_url", comment: "facebook_url"
    t.text "profile", comment: "紹介文"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
