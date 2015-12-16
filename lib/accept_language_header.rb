require 'accept_language_header/version'
require 'accept_language_header/locale'
require 'accept_language_header/collection'

#
#   AcceptLanguageHeader.parse('zh-CN,zh-HK;q=0.9,zh;q=0.7,zh-TW;q=0.6')
#   # => #<AcceptLanguageHeader::Collection ...>
#
module AcceptLanguageHeader
  def self.parse(header)
    locales = header.split(/,(?:\s*)/)
    result = []
    locales.each do |locale|
      result << parse_locale(locale)
    end

    Collection.new(result.sort)
  end

  private

  def self.parse_locale(locale)
    lang_range, weight_str = locale.split(/\s*;\s*/)
    weight = 1.0
    weight = Regexp.last_match[1].to_f if weight_str =~ /q=([0-9\.]+)/i
    Locale.new(lang_range, weight)
  end
end
