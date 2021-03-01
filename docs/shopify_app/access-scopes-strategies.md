# Access Scopes Strategies
The Shopify App gem provides handling changes to scopes for both shop/offline and user/online tokens. By default, the `ShopifyApp::AccessScopes::ShopStrategy` and `ShopifyApp::AccessScopes::UserStrategy` strategies are used on app loads and during OAuth.

To add custom strategies, the signatures for shop and user strategies can be constructed as follows:

## Custom shop access scopes strategy

```ruby
class CustomShopStrategy
  class << self
    def update_access_scopes?(shop_domain)
      # Define rules for when the access scopes on a shop/offline token need to be updated
    end
  end
end
```

## Custom user access scopes strategy

```ruby
class CustomUserStrategy
  class << self
    def update_access_scopes?(user_id: nil, shopify_user_id: nil)
      # Define rules for when the access scopes on a user/online token need to be updated
    end
  end
end
```

## ShopAccessScopesVerification
The `ShopifyApp::ShopAccessScopesVerification` concern helps merchants grant new access scopes requested by the app. The concern compares the current access scopes granted by the shop and compares them with the scopes requested by the app. If there is a mismatch in configuration, the merchant is redirected to login via OAuth and grant the net new scopes.
