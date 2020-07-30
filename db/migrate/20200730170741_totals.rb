class Totals < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_totals, id: false do |t|
      t.string :candidate_id
      t.string :candidate_name
      t.string :incumbent
      t.string :party_code
      t.string :party_name
      t.float :total_receipts
      t.float :transfers_from_comms
      t.float :total_disbursements
      t.float :tranfers_to_comms
      t.float :cash_on_hand_start
      t.float :cash_on_hand_end
      t.float :contributions_from_candidate
      t.float :loans_from_candidate
      t.float :other_loans
      t.float :candidate_loan_repayments
      t.float :other_loan_repayments
      t.float :debts
      t.float :total_individual_contributions
      t.string  :candidate_state
      t.string :district
      t.string :special_election
      t.string  :primary_election
      t.string  :runoff_election
      t.string  :general_election
      t.string  :general_percent
      t.float :contrib_from_other_comms
      t.float :contrib_from_party_comms
      t.datetime  :coverage_end_date
      t.float :individual_refunds
      t.float :comm_refunds
    end
  end
end
