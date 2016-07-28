require 'active_support'
require 'active_support/core_ext'
require 'timecop'

describe Jihoh do
  describe 'report time or not' do
    let(:report_time) { Time.local(2016, 8, 13, 15, 50) }
    let(:non_report_time) { Time.local(2016, 8, 13, 15, 40) }

    it 'report time' do
      Timecop.freeze(report_time)
      (0..9).each do |n|
        Timecop.travel(report_time + n.minutes)
        expect(Jihoh.new.report_time?).to be_truthy
      end
    end

    it 'non report time' do
      Timecop.freeze(non_report_time)
      (0..9).each do |n|
        Timecop.travel(non_report_time + n.minutes)
        expect(Jihoh.new.report_time?).to be_falsey
      end
    end
  end

  after { Timecop.return }
end
