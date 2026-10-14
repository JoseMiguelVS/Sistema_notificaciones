import '../models/notificacion.dart';

class GestorNotificaciones {
  // ---------- PATRON SINGLETON ----------

  // Instancia única, creada "lazy" la primera vez que se usa
  // El constructor _internal() es privado
  static final GestorNotificaciones _instancia =
      GestorNotificaciones._internal();

  // Constructor, siempre devuelve la misma instancia
  factory GestorNotificaciones() => _instancia;

  // Constructor privado real (inicializa el estado
  GestorNotificaciones._internal();

  // ---------- ESTADO INTERNO ----------

  // Historial centralizado (una sola lista para toda la app)
  final List<Notificacion> _historial = [];

  // Set de claves para detectar duplicados en O(1)
  final Set<String> _claves = {};

  // ---------- API  ----------

  /// Vista de solo lectura del historial
  List<Notificacion> get historial => List.unmodifiable(_historial);

  // Registra una notificacion
  // Devuelve false si era duplicada
  bool enviar(Notificacion n) {
    // Clave unica = tipo + título + mensaje
    final clave = '${n.runtimeType}|${n.titulo}|${n.mensaje}';

    if (_claves.contains(clave)) return false;

    _claves.add(clave);
    _historial.add(n);
    return true;
  }

  // Limpia el estado
  void limpiar() {
    _historial.clear();
    _claves.clear();
  }
}