class AddTo < ActiveRecord::Migration[6.0]
  def change
    rename_column :financial_totals, :tranfers_to_comms, :transfers_to_comms
    add_column :reps, :total_receipts, :float
    add_column :reps, :transfers_from_comms, :float
    add_column :reps, :total_disbursements, :float
    add_column :reps, :transfers_to_comms, :float
    add_column :reps, :cash_on_hand_start, :float
    add_column :reps, :cash_on_hand_end, :float
    add_column :reps, :contributions_from_candidate, :float
    add_column :reps, :loans_from_candidate, :float
    add_column :reps, :other_loans, :float
    add_column :reps, :candidate_loan_repayments, :float
    add_column :reps, :other_loan_repayments, :float
    add_column :reps, :debts, :float
    add_column :reps, :total_individual_contributions, :float
    add_column :reps, :contrib_from_other_comms, :float
    add_column :reps, :contrib_from_party_comms, :float
    add_column :reps, :coverage_end_date, :datetime
    add_column :reps, :individual_refunds, :float
    add_column :reps, :comm_refunds, :float
    add_column :senators, :total_receipts, :float
    add_column :senators, :transfers_from_comms, :float
    add_column :senators, :total_disbursements, :float
    add_column :senators, :transfers_to_comms, :float
    add_column :senators, :cash_on_hand_start, :float
    add_column :senators, :cash_on_hand_end, :float
    add_column :senators, :contributions_from_candidate, :float
    add_column :senators, :loans_from_candidate, :float
    add_column :senators, :other_loans, :float
    add_column :senators, :candidate_loan_repayments, :float
    add_column :senators, :other_loan_repayments, :float
    add_column :senators, :debts, :float
    add_column :senators, :total_individual_contributions, :float
    add_column :senators, :contrib_from_other_comms, :float
    add_column :senators, :contrib_from_party_comms, :float
    add_column :senators, :coverage_end_date, :datetime
    add_column :senators, :individual_refunds, :float
    add_column :senators, :comm_refunds, :float

  end
end
