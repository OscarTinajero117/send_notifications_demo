defmodule NotificationsDemo.SendNotification do
  @moduledoc """
  Módulo para enviar notificaciones a través de Firebase Cloud Messaging.
  """

  @fcm_endpoint "https://fcm.googleapis.com/v1/projects/notifications-demo-6b259/messages:send"

  @token_app "fAT2B5VaRHSbNELW645dLq:APA91bHss7gFS2coZZi-oIyzlDWKcudTenadIszjie1sEFQFYv7LaclsgG5RsGoB7isAUXAHaNaQiADRQwtVq8oY7wJWL1IZDqnvY_EZ-EMp_33KJU42mqF9mTH5inf0OCuQ3cUf8GO6"

  def send_notify(title, body) do
    %{token: token, type: type} = NotificationsDemo.Goth |> Goth.fetch!()

    headers = %{
      "Content-Type" => "application/json",
      "Authorization" => "#{type} #{token}"
    }

    payload = %{
      "message" => %{
        "token" => @token_app,
        "notification" => %{
          "title" => title,
          "body" => body
        }
      }
    }

    case HTTPoison.post(@fcm_endpoint, Jason.encode!(payload), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 401}} ->
        {:error, "No autorizado"}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Recurso no encontrado"}

      {:ok, %HTTPoison.Response{status_code: 500}} ->
        {:error, "Error interno del servidor"}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
