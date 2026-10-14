import 'singleton/gestor_notificaciones.dart';
import 'adapter/aviso_web.dart';

void main() {
  // JSON tal como lo envía el sistema web.
  final avisoWeb = {
    'asunto': 'Suspension de clases',
    'contenido': 'Mañana no habra clases',
    'nivel': 'urgente',
  };

  // El Adapter traduce al formato de la app.
  final aviso = AvisoWeb.adaptar(avisoWeb);

  // El Singleton guarda en el registro central.
  final gestor = GestorNotificaciones();
  gestor.enviar(aviso);

  // Mostrar resultado.
  print(aviso.mostrar());
}