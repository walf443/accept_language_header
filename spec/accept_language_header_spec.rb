require 'spec_helper'

RSpec.describe AcceptLanguageHeader do
  def ah_locale(locale, weight)
    AcceptLanguageHeader::Locale.new(locale, weight)
  end

  describe '.parse' do
    subject { AcceptLanguageHeader.parse(header) }

    context 'basic' do
      let(:header) { 'ja,en;q=0.8,en-US;q=0.6' }
      it do
        is_expected.to eq(
          AcceptLanguageHeader::Collection.new([
            ah_locale('ja', 1.0),
            ah_locale('en', 0.8),
            ah_locale('en-US', 0.6)
          ])
        )
      end
    end

    context 'basic2' do
      let(:header) { 'zh-CN,zh-HK;q=0.9,zh;q=0.7,zh-TW;q=0.6,ja;q=0.4' }
      it do
        is_expected.to eq(
          AcceptLanguageHeader::Collection.new([
            ah_locale('zh-CN', 1.0),
            ah_locale('zh-HK', 0.9),
            ah_locale('zh', 0.7),
            ah_locale('zh-TW', 0.6),
            ah_locale('ja', 0.4)
          ])
        )
      end
    end

    context 'invalid order header' do
      let(:header) { 'ja,en;q=0.5,en-US;q=0.6' }
      it do
        is_expected.to eq(
          AcceptLanguageHeader::Collection.new([
            ah_locale('ja', 1.0),
            ah_locale('en-US', 0.6),
            ah_locale('en', 0.5)
          ])
        )
      end
    end
  end

  describe '#lookup' do
    subject { header.lookup(availables) }
    let(:target) do
      'zh-CN,zh;q=0.7,zh-TW;q=0.6,en-US;q=0.3,en;q=0.1'
    end

    let(:header) do
      AcceptLanguageHeader.parse(target)
    end

    context 'when availables is "zh-CN"' do
      let(:availables) { ['zh-CN', 'zh', 'en'] }
      it { is_expected.to eq('zh-CN') }
    end

    context 'when availables is "en", "en-US"' do
      let(:availables) { ['en-US', 'en'] }
      it { is_expected.to eq('en-US') }
    end

    context 'when availables is "br"' do
      let(:availables) { ['br'] }
      it { is_expected.to be_nil }
    end
  end
end
