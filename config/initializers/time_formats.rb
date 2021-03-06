#
# Date and Time formats
#
{
  month_day_comma_year: "%Y-%m-%d",
  date_with_dashes: "%Y-%m-%d",
  short_date: "%x",
  simple: "%B %d, %Y",
  rfc822: "%a, %d %b %Y %H:%M:%S %z",
  month: "%B",
  invoice: "%y%m%d",
  abbreviated_month: "%b",
  day_of_month: "%d",
  month_year: "%m/%Y"
}.each do |k, v|
  Date::DATE_FORMATS[k] = v
  Time::DATE_FORMATS[k] = v
end

#
# Time formats
#
Time::DATE_FORMATS.merge!(
  {
    time: "%l:%M%p"
  }
)
