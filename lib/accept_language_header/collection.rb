# frozen_string_literal: true

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
      result = lookup_locale(availables)
      availables.detect { |expected| result.match?(expected) } if result
    end

    def lookup_locale(availables)
      @locales.detect do |locale|
        availables.detect { |expected| locale.match?(expected) }
      end
    end

    def to_s
      locales.sort.join(',')
    end

    protected

    attr_reader :locales
  end
end
