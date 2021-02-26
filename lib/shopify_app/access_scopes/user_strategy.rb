# frozen_string_literal: true

module ShopifyApp
  module AccessScopes
    class UserStrategy
      class << self
        def update_access_scopes_for_user_id?(user_id)
          user_access_scopes = user_access_tokens_by_user_id(user_id)
          return true unless user_access_scopes
          configuration_access_scopes != user_access_scopes
        end

        def update_access_scopes_for_shopify_user_id?(shopify_user_id)
          user_access_scopes = user_access_tokens_by_shopify_user_id(shopify_user_id)
          return true unless user_access_scopes
          configuration_access_scopes != user_access_scopes
        end

        private

        def user_access_tokens_by_user_id(user_id)
          ShopifyApp::SessionRepository.retrieve_user_session(user_id).access_scopes
        end

        def user_access_tokens_by_shopify_user_id(shopify_user_id)
          ShopifyApp::SessionRepository.retrieve_user_session_by_shopify_user_id(shopify_user_id).access_scopes
        end

        def configuration_access_scopes
          ShopifyAPI::ApiAccess.new(ShopifyApp.configuration.user_access_scopes)
        end
      end
    end
  end
end
