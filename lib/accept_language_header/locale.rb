module AcceptLanguageHeader
  class Locale
    attr_reader :locale, :weight

    def initialize(locale, weight = 1.0)
      @locale = locale.downcase
      @weight = weight
    end

    def <=>(other)
      -1 * weight <=> -1 * other.weight
    end

    def ==(other)
      @locale == other.locale && @weight == other.weight
    end

    def match?(str)
      @locale.start_with?(str.downcase)
    end

    def to_s
      "#{locale};q=#{weight}"
    end
  end
end
