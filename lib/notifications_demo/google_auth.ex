defmodule NotificationsDemo.GoogleAuth do
  use OAuth2.Strategy

  # Public API
  def client do
    OAuth2.Client.new(
      strategy: __MODULE__,
      client_id: "1040451260959-60sihkpo3bafcqaudbieh8u2om4su3fk.apps.googleusercontent.com",
      client_secret: "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",
      redirect_uri: "http://localhost:4000/auth/callback",
      site: "https://accounts.google.com",
      authorize_url: "/o/oauth2/auth",
      token_url: "/o/oauth2/token"
    )
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), params)
  end

  # you can pass options to the underlying http library via `opts` parameter
  def get_token!(params \\ [], headers \\ [], opts \\ []) do
    OAuth2.Client.get_token!(client(), params, headers, opts)
  end

  # Strategy Callbacks
  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_header("accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
