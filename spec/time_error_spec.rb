require 'time_error'

RSpec.describe TimeError do
  it 'returns the difference between server time and computer time' do
    fake_requester = double :dbl_requester
    expect(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip"))
    .and_return('{"abbreviation":"GMT","client_ip":"2a02:c7e:504a:c300:a9c0:de12:43d8:184e","datetime":"2022-11-24T14:19:45.969487+00:00","day_of_week":4,"day_of_year":328,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1669299585,"utc_datetime":"2022-11-24T14:19:45.969487+00:00","utc_offset":"+00:00","week_number":47}')
    time_error = TimeError.new(fake_requester)
    time = Time.new(2022, 11, 24, 14, 19, 45)
    expect(time_error.error(time)).to eq 0.969487
  end
end