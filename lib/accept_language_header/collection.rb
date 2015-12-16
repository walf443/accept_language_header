module AcceptLanguageHeader
  # collection of Locale. locales order should sorted by priority weight.
  class Collection
    def initialize(locales)
      @locales = locales
    end

    def ==(other)
      @locales == other.locales
    end

    def lookup(availables)
      result = @locales.detect do |locale|
        availables.detect { |expected| locale.match?(expected) }
      end
      availables.detect { |expected| result.match?(expected) } if result
    end

    def to_s
      locales.sort.join(',')
    end

    protected

    attr_reader :locales
  end
end
