# frozen_string_literal: true

require 'time'

RSpec.describe Time do
  context 'can we agree on same timezone?' do
    it 'does convert to UTC in summer' do
      time = Time.parse('2021-07-07T15:31Z').to_i.to_s
      expect(time).to eq '1625671860'
    end
    it 'converts to UTC in winter' do
      time = Time.parse('2021-01-01T01:01Z').to_i.to_s
      expect(time).to eq '1609462860'
    end
  end
end
