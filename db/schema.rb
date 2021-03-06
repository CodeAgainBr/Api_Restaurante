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

ActiveRecord::Schema.define(version: 20181207232719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer  "quantidade", default: 0
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["pedido_id"], name: "index_items_on_pedido_id", using: :btree
    t.index ["produto_id"], name: "index_items_on_produto_id", using: :btree
  end

  create_table "mesas", force: :cascade do |t|
    t.integer  "numero"
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["numero"], name: "index_mesas_on_numero", unique: true, using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.string   "status",     default: "aberto"
    t.integer  "mesa_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["mesa_id"], name: "index_pedidos_on_mesa_id", using: :btree
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.float    "valor",      default: 0.0
    t.string   "descricao"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["nome"], name: "index_produtos_on_nome", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "nome"
    t.string   "login"
    t.boolean  "funcionario",                       default: false
    t.boolean  "admin",                             default: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "items", "pedidos"
  add_foreign_key "items", "produtos"
  add_foreign_key "pedidos", "mesas"
end
