# frozen_string_literal: true

require 'carbon'

RSpec.describe Carbon do
  context 'in general' do
    it 'format_message should return a message in carbon format' do
      expect(Carbon.format_message('/cpu/load', '0.08', '2021-07-07 15:31')).to eq '/cpu/load 0.08 1625664660'
      expect(Carbon.format_time('2021-07-07T15:31Z')).to eq '1625671860'
      expect(Carbon.format_time('1625664660')).to eq '1625664660'
      expect(Carbon.format_time('2021-07-07T13:31:00Z')).to eq '1625664660'
      expect(Carbon.format_time('2021-07-21T13:31:00Z')).to eq '1626874260'
    end

    it 'sends the right message to the right tcp-socket' do
      mock = double('TCPSocket')
      expect(mock).to receive(:open).with('localhost', 2003)
      expect(mock).to receive(:print).with('/test/local 12 1611242460')
      expect(mock).to receive(:close)

      carb = Carbon.new(mock)
      carb.send('/test/local', 12, '2021-01-21T15:21Z')
    end
  end
end
