module AcceptLanguageHeader
  class Collection
    def initialize(locales)
      @locales = locales
    end

    def ==(other)
      @locales == other.locales
    end

    def lookup(availables)
      result = @locales.detect { |locale| availables.detect { |expected| locale.match?(expected) } }
      if result
        availables.detect { |expected| result.match?(expected) }
      end
    end

    def to_s
      locales.sort.join(',')
    end

    protected

    attr_reader :locales
  end
end
