# frozen_string_literal: true
module AccessScopesStrategyHelpers
  class MockUserScopesMatchStrategy
    class << self
      def update_access_scopes_for_shopify_user_id?(*_args)
        false
      end

      def update_access_scopes_for_user_id?(*_args)
        false
      end
    end
  end

  class MockUserScopesMismatchStrategy
    class << self
      def update_access_scopes_for_shopify_user_id?(*_args)
        true
      end

      def update_access_scopes_for_user_id?(*_args)
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
