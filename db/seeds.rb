# records = FinancialTotal.all
# total = records.count

# records.each_with_index do |record, idx|
#     type = record.candidate_id[0]
#     unless type == "P"
#         if type == "H"
#             target = Rep.where(candidate_id: record.candidate_id)
#         elsif type == "S"
#             target = Senator.where(candidate_id: record.candidate_id)
#         end

#         if target
#             puts "Writing donation info for record #{idx+1} of #{total}"
#             target.update(
#                 total_receipts: record.total_receipts,
#                 transfers_from_comms: record.transfers_from_comms,
#                 total_disbursements: record.total_disbursements,
#                 transfers_to_comms: record.transfers_to_comms,
#                 cash_on_hand_start: record.cash_on_hand_start,
#                 cash_on_hand_end:   record.cash_on_hand_end,
#                 contributions_from_candidate: record.contributions_from_candidate,
#                 loans_from_candidate: record.loans_from_candidate,
#                 other_loans:    record.other_loans,
#                 candidate_loan_repayments:  record.candidate_loan_repayments,
#                 other_loan_repayments:  record.other_loan_repayments,
#                 debts:  record.debts,
#                 total_individual_contributions: record.total_individual_contributions,
#                 contrib_from_other_comms:   record.contrib_from_other_comms,
#                 contrib_from_party_comms:   record.contrib_from_party_comms,
#                 coverage_end_date:  record.coverage_end_date,
#                 individual_refunds: record.individual_refunds,
#                 comm_refunds:   record.comm_refunds
#             )
#         end
#     end
# end

#adjustment for multiple authorized committees here
# sens = Senator.where.not(transfers_from_comms: 0.0, transfers_to_comms: 0)
# reps = Rep.where.not(transfers_from_comms: 0, transfers_to_comms: 0)

# sens.each do |sen|
#     adjustment = [sen.transfers_to_comms, sen.transfers_from_comms].min
#     receipts = sen.total_receipts - adjustment
#     disbursements = sen.total_individual_contributions - adjustment
#     sen.update(total_disbursements: disbursements, total_receipts: receipts)
# end
# reps.each do |rep|
#     adjustment = [rep.transfers_to_comms, rep.transfers_from_comms].min
#     receipts = rep.total_receipts - adjustment
#     disbursements = rep.total_individual_contributions - adjustment
#     rep.update(total_disbursements: disbursements, total_receipts: receipts)
# end

# sens = Senator.all
# reps = Rep.all

# reps.each do |senator|
#     name, state = senator.candidate_name.split(" (")
#     if state
#         puts "Updating #{senator.candidate_name}"
#         senator.update(candidate_name: name)
#     end
# end