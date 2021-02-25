# frozen_string_literal: true

module ShopifyApp
  module AccessScopes
    class ShopStrategy
      class << self
        def scopes_mismatch?(shop_domain)
          shop_access_scopes = shop_access_tokens(shop_domain)
          return true unless shop_access_scopes
          configuration_access_scopes != shop_access_tokens(shop_domain)
        end

        private

        def shop_access_tokens(shop_domain)
          ShopifyApp::SessionRepository.retrieve_shop_session_by_shopify_domain(shop_domain).access_scopes
        end

        def configuration_access_scopes
          ShopifyAPI::ApiAccess.new(ShopifyApp.configuration.shop_access_scopes)
        end
      end
    end
  end
end
