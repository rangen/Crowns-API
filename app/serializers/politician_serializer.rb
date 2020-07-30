class PoliticianSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  has_many :twitter_accounts
  
  attributes :candidate_name, :party, :on_ballot, :photo_url, :id, :incumbent, :total_receipts
  attributes :transfers_from_comms, :total_disbursements, :transfers_to_comms, :cash_on_hand_start
  attributes :cash_on_hand_end, :contributions_from_candidate, :loans_from_candidate, :other_loans
  attributes :candidate_loan_repayments, :other_loan_repayments, :debts, :total_individual_contributions
  attributes :contrib_from_other_comms, :contrib_from_party_comms, :individual_refunds, :comm_refunds

  attributes :coverage_end_date do |object|
    if object.coverage_end_date
      object.coverage_end_date.strftime('%B %d %Y')
    end
  end

  attributes :has_tweets do |object|
    !object.twitter_accounts.empty?
  end
end
