// Clase abstracta base
// Define el "contrato"
abstract class Notificacion {
  final String titulo; // Encabezado corto
  final String mensaje; // Cuerpo de la notificación
  final String prioridad; // normal / alta / urgente

  Notificacion({
    required this.titulo,
    required this.mensaje,
    required this.prioridad,
  });

  /// Cada subclase decide como se muestra
  String mostrar();
}

// Subclase aviso
class NotificacionAviso extends Notificacion {
  NotificacionAviso({
    required super.titulo,
    required super.mensaje,
    super.prioridad = 'normal', // valor por defecto
  });

  @override
  String mostrar() => '[AVISO][$prioridad] $titulo: $mensaje';
}

// Subclase tarea
class NotificacionTarea extends Notificacion {
  NotificacionTarea({
    required super.titulo,
    required super.mensaje,
    super.prioridad = 'normal',
  });

  @override
  String mostrar() => '[TAREA][$prioridad] $titulo: $mensaje';
}

// Subclase examen
class NotificacionExamen extends Notificacion {
  NotificacionExamen({
    required super.titulo,
    required super.mensaje,
    super.prioridad = 'alta',
  });

  @override
  String mostrar() => '[EXAMEN][$prioridad] $titulo: $mensaje';
}
