# defmodule NotificationsDemo.Sample do
#   def run_sample do
#     service_account_path =
#       "/Users/nerus-dev/developer/cloud-messaging/firebase/notifications_demo/notifications-demo-6b259-firebase-adminsdk-ukyqs-e9581e2ad0.json"

#     # Reemplaza con el token del dispositivo Flutter
#     target_token =
#       "flJ_z-VeRD2UZH37xhkUdA:APA91bE7tbgcnm1Wai5UFnMTwsa9tuiLtQVNkKPA6L7CyteTvsGzLiIGo6L_6iOqoK-uzmm42Y4SYOySQIl1DTVBVwuaa0wIec_hRoTSEp6THxuz2DA-wh5D7nmIyTH3MfrUDF-GBKYi"

#     title = "¡Hola!"
#     body = "Esta es una notificación enviada desde Elixir."

#     case NotificationsDemo.GoogleAuth.get_access_token(service_account_path) do
#       {:ok, access_token} ->
#         case NotificationsDemo.SendNotification.send_notification(
#                access_token,
#                target_token,
#                title,
#                body
#              ) do
#           {:ok, response} ->
#             IO.puts("Notificación enviada exitosamente: #{inspect(response)}")

#           {:error, reason} ->
#             IO.puts("Error al enviar la notificación: #{inspect(reason)}")
#         end

#       {:error, reason} ->
#         IO.puts("Error al obtener el token de acceso: #{inspect(reason)}")
#     end
#   end
# end
