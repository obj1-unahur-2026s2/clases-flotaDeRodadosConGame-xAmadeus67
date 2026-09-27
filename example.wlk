class Rodado {

  method velocidadMaxima() 
  method capacidad() 
  method color() 
  method peso() 
}

class Corsa inherits Rodado {
  var color 

  override method velocidadMaxima() = 150
  override method capacidad() = 4
  override method color() = color
  override method peso() = 1300
}
class Kwid inherits Rodado {
  var tanqueAdicional

  override method velocidadMaxima() = if (self.tieneTanquePuesto()) 120 else 110
  override method capacidad() = if (self.tieneTanquePuesto()) 3 else 4
  override method color() = "azul"
  override method peso() = if (self.tieneTanquePuesto()) 1350 else 1200
  method tieneTanquePuesto() {
    return tanqueAdicional
  }
}

object trafic {
  var motor = pulenta
  var interior = comodo

  method cambiarInterior(unInterior){
    interior = unInterior
  }
  method cambiarMotor(unMotor) {
    motor = unMotor
  }
  method capacidad() = interior.capacidad()
  method peso() = 4000 + (interior.peso() + motor.peso())
  method velocidadMaxima() = motor.velocidadMaxima()
  method color() = "blanco"

  
}

object comodo {
  method capacidad() = 5
  method peso() = 700
}

object popular {
  method capacidad() = 12
  method peso() = 1000
}

object pulenta {
  method velocidadMaxima() = 130
  method peso() = 800
}

object bataton {
  method velocidadMaxima() = 80
  method peso() = 500
}

class Especial inherits Rodado {
  var capacidad
  var velocidad
  var peso
  var color

  override method velocidadMaxima() = velocidad
  override method capacidad() = capacidad
  override method color() = color
  override method peso() = peso 
}

class Dependencia {
  const flota = []
  var empleados

  method cantidadDeEmpleados() = empleados
  method agregarAFlota(unRodado) {
    return flota.add(unRodado)
  }
  method quitarDeFlota(unRodado) {
    return flota.remove(unRodado)
  }
  method pesoTotalFlota() {
    return flota.sum({r=>r.peso()})
  }
  method estaBienEquipada() {
    return self.cantidadDeRodadosEnFlota() > 2 && self.tienenAlMenosVelocidad(100)
  }
  method cantidadDeRodadosEnFlota() {
    return flota.size()
  }
  method tienenAlMenosVelocidad(unaVelocidad) {
    return flota.all({r=>r.velocidadMaxima() >= unaVelocidad})
  }
  method capacidadTotalEnColor(unColor) {
    return self.flotaDeColor(unColor).sum({r=>r.capacidad()})
  }
  method flotaDeColor(unColor) {
    return flota.filter({r=>r.color() == unColor})
  }
  method colorDelRodadoMasRapido() {
    return flota.max({r=>r.velocidadMaxima()}).color()
  }
  method capacidadFaltante() {
    return self.cantidadDeEmpleados() - self.capacidadTotal()
  }
  method capacidadTotal() {
    return flota.sum({r=>r.capacidad()})
  }
  method esGrande() {
    return self.cantidadDeEmpleados() >= 40 && self.cantidadDeRodadosEnFlota() >= 5
  }
}