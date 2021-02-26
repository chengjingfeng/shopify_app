# frozen_string_literal: true
module AccessScopesStrategyHelpers
  class MockUserScopesMatchStrategy
    class << self
      def scopes_mismatch_by_shopify_user_id?(*_args)
        false
      end

      def scopes_mismatch_by_user_id?(*_args)
        false
      end
    end
  end

  class MockUserScopesMismatchStrategy
    class << self
      def scopes_mismatch_by_shopify_user_id?(*_args)
        true
      end

      def scopes_mismatch_by_user_id?(*_args)
        true
      end
    end
  end

  class MockShopScopesMatchStrategy
    class << self
      def update_access_scopes?(*_args)
        false
      end
    end
  end

  class MockShopScopesMismatchStrategy
    class << self
      def update_access_scopes?(*_args)
        true
      end
    end
  end
end
