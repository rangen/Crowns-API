# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_06_205709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cook_indices", force: :cascade do |t|
    t.string "location_type"
    t.string "location_id"
    t.string "value"
    t.float "clinton"
    t.float "trump"
    t.float "obama"
    t.float "romney"
  end

  create_table "districts", id: :serial, force: :cascade do |t|
    t.text "number"
    t.integer "state_id", limit: 2
  end

  create_table "financial_totals", id: false, force: :cascade do |t|
    t.string "candidate_id"
    t.string "candidate_name"
    t.string "incumbent"
    t.string "party_code"
    t.string "party_name"
    t.float "total_receipts"
    t.float "transfers_from_comms"
    t.float "total_disbursements"
    t.float "transfers_to_comms"
    t.float "cash_on_hand_start"
    t.float "cash_on_hand_end"
    t.float "contributions_from_candidate"
    t.float "loans_from_candidate"
    t.float "other_loans"
    t.float "candidate_loan_repayments"
    t.float "other_loan_repayments"
    t.float "debts"
    t.float "total_individual_contributions"
    t.string "candidate_state"
    t.string "district"
    t.string "special_election"
    t.string "primary_election"
    t.string "runoff_election"
    t.string "general_election"
    t.string "general_percent"
    t.float "contrib_from_other_comms"
    t.float "contrib_from_party_comms"
    t.datetime "coverage_end_date"
    t.float "individual_refunds"
    t.float "comm_refunds"
  end

  create_table "reps", id: :serial, force: :cascade do |t|
    t.text "candidate_id"
    t.text "candidate_name"
    t.text "party"
    t.text "office_state"
    t.integer "district_name", limit: 2
    t.text "incumbent"
    t.text "status"
    t.text "principal_committee"
    t.text "official_twitter"
    t.text "update_status"
    t.text "bp_link"
    t.text "photo_url"
    t.text "official_facebook"
    t.text "campaign_url"
    t.text "campaign_twitter"
    t.text "personal_twitter"
    t.text "campaign_facebook"
    t.text "official_url"
    t.text "personal_website"
    t.integer "state_id"
    t.integer "district_id"
    t.boolean "on_ballot"
    t.float "total_receipts"
    t.float "transfers_from_comms"
    t.float "total_disbursements"
    t.float "transfers_to_comms"
    t.float "cash_on_hand_start"
    t.float "cash_on_hand_end"
    t.float "contributions_from_candidate"
    t.float "loans_from_candidate"
    t.float "other_loans"
    t.float "candidate_loan_repayments"
    t.float "other_loan_repayments"
    t.float "debts"
    t.float "total_individual_contributions"
    t.float "contrib_from_other_comms"
    t.float "contrib_from_party_comms"
    t.datetime "coverage_end_date"
    t.float "individual_refunds"
    t.float "comm_refunds"
  end

  create_table "senators", id: :serial, force: :cascade do |t|
    t.text "candidate_id"
    t.text "candidate_name"
    t.text "party"
    t.text "office_state"
    t.text "incumbent"
    t.text "status"
    t.text "principal_committee"
    t.text "official_twitter"
    t.text "update_status"
    t.text "bp_link"
    t.text "photo_url"
    t.text "official_facebook"
    t.text "campaign_url"
    t.text "campaign_twitter"
    t.text "personal_twitter"
    t.text "campaign_facebook"
    t.text "official_url"
    t.text "personal_website"
    t.integer "state_id"
    t.boolean "on_ballot"
    t.float "total_receipts"
    t.float "transfers_from_comms"
    t.float "total_disbursements"
    t.float "transfers_to_comms"
    t.float "cash_on_hand_start"
    t.float "cash_on_hand_end"
    t.float "contributions_from_candidate"
    t.float "loans_from_candidate"
    t.float "other_loans"
    t.float "candidate_loan_repayments"
    t.float "other_loan_repayments"
    t.float "debts"
    t.float "total_individual_contributions"
    t.float "contrib_from_other_comms"
    t.float "contrib_from_party_comms"
    t.datetime "coverage_end_date"
    t.float "individual_refunds"
    t.float "comm_refunds"
  end

  create_table "states", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "abbreviation"
    t.date "primary_date"
    t.boolean "accepts_write_ins"
    t.integer "num_districts"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "twitter_account_id"
    t.datetime "created"
    t.text "in_reply_to"
    t.text "snowflake_id"
    t.index ["twitter_account_id"], name: "index_tweets_on_twitter_account_id"
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.string "politician_type"
    t.integer "politician_id"
    t.string "handle"
    t.string "use", default: "mentioned"
    t.datetime "newest_tweet_time"
    t.datetime "oldest_tweet_time"
    t.bigint "since_id"
    t.bigint "max_id"
    t.datetime "last_checked"
    t.boolean "oldest_saved"
    t.integer "tweet_count"
    t.index ["politician_id", "politician_type"], name: "index_twitter_accounts_on_politician_id_and_politician_type"
  end

  create_table "webhits", force: :cascade do |t|
    t.string "query"
    t.string "client_ip"
    t.datetime "created_at", null: false
    t.string "normalized"
    t.integer "district_id"
  end

end
