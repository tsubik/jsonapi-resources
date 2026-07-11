require 'active_support/deprecation'

module JSONAPI
  # Rails 7.1 stopped `ActiveSupport::Deprecation` from being a singleton and
  # Rails 8.0 removed the class-level `.warn` / `.instance` methods entirely, so
  # each library is expected to own its deprecator instance.
  #
  # On Rails < 7.1 `.new` is private (the class still includes Singleton), which
  # is what we probe for to stay compatible with the older versions this branch
  # supports.
  def self.deprecator
    @deprecator ||= if ActiveSupport::Deprecation.respond_to?(:new)
                      ActiveSupport::Deprecation.new('0.10', 'jsonapi-resources')
                    else
                      ActiveSupport::Deprecation
                    end
  end
end
