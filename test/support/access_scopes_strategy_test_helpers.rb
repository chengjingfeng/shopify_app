# frozen_string_literal: true
module AccessScopesStrategyHelpers
  class MockScopesMatchStrategy
    class << self
      def update_access_scopes?(*_args)
        false
      end
    end
  end

  class MockScopesMismatchStrategy
    class << self
      def update_access_scopes?(*_args)
        true
      end
    end
  end
end
