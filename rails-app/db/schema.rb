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

ActiveRecord::Schema.define(version: 2019_08_05_102030) do

  create_table "authentications", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "db_metadata", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "version"
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_people_on_email", unique: true
  end

  create_table "results", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "id"
    t.string "test", limit: 256
    t.integer "result"
    t.float "test_time", default: 0.0
    t.string "core_dump_path", limit: 500
    t.text "leak_summary", limit: 4294967295
    t.index ["id"], name: "id"
  end

  create_table "test_run", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "jenkins_id"
    t.datetime "start_time"
    t.string "target", limit: 256
    t.string "box", limit: 256
    t.string "product", limit: 256
    t.string "mariadb_version", limit: 256
    t.string "test_code_commit_id", limit: 256
    t.string "maxscale_commit_id", limit: 256
    t.string "job_name", limit: 256
    t.text "cmake_flags"
    t.string "maxscale_source", limit: 256, default: "NOT FOUND"
    t.string "logs_dir", limit: 256
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "results", "test_run", column: "id", name: "results_ibfk_1"
end
