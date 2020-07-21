require 'google/apis/civicinfo_v2'

$civic = Google::Apis::CivicinfoV2::CivicInfoService.new
$civic.key = Rails.application.credentials.google_civic