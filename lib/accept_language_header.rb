require 'accept_language_header/version'
require 'accept_language_header/locale'
require 'accept_language_header/collection'
module AcceptLanguageHeader
  def self.parse(header)
    locales = header.split(/,(?:\s*)/)
    result = []
    locales.each do |locale|
      lang_range, weight_str = locale.split(/\s*;\s*/)
      weight = 1.0
      if weight_str =~ /q=([0-9\.]+)/
        weight = Regexp.last_match[1].to_f
      end
      result << Locale.new(lang_range, weight)
    end

    Collection.new(result.sort)
  end

end
