AnalyticsRuby = Segment::Analytics.new(
  write_key: Rails.application.secrets.segment_write_key,
  on_error: Proc.new { |_status, msg| print msg }
)
