import '../models/notificacion.dart';

// Clase adapter: es el "traductor" entre dos interfaces
// incompatibles (el JSON del web y la clase NotificacionAviso).
class AvisoWeb {
  /// Recibe el Map<String, dynamic> (JSON decodificado) del web
  /// y devuelve una NotificacionAviso lista para usar en la app.
  static NotificacionAviso adaptar(Map<String, dynamic> json) {
    // Mapeo de campos:
    //   asunto    (web)  ->  titulo     (app)
    //   contenido (web)  ->  mensaje    (app)
    //   nivel     (web)  ->  prioridad  (app)
    return NotificacionAviso(
      titulo: json['asunto'] ?? 'Sin título',
      mensaje: json['contenido'] ?? '',
      prioridad: json['nivel'] ?? 'normal',
    );
  }
}
