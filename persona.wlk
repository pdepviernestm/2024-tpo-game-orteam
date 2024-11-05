// La persona tiene que tener una "mano" (array de cartas) y un metodo que en base al mazo general del juego, saque una carta y la agregue a su mano.
// Persona.posicion es un atributo que indica la posicion de la persona en la mesa. ({x: 0, y: 0})
const maxSplits = 4

class Posicion {
  var property x = 0
  var property y = 0
}

class Persona {
  const mano = []
  var property posicion = new Posicion()
  
  method mostrarMano() {
    mano.forEach({ carta => game.addVisual(carta) })
  }
  
  method sacarCarta(mazoGeneral) {
    mano.forEach({ carta => game.removeVisual(carta) })
    const carta = mazoGeneral.first()
    const cantidadDeCartas = mano.size()
    carta.position(game.at(posicion.x() + (mano.size() * 12), posicion.y()))
    mano.add(carta)
    self.mostrarMano()
  }
}

class Jugador inherits Persona {
  var property dinero = 250
  var property splits = maxSplits
  var property apuesta = 0
  
  method aumentarApuesta(cantidad) {
    if ((cantidad < 0) && ((apuesta + cantidad) < 0)) {
      return
    }
    
    if ((cantidad > 0) && ((dinero - cantidad) < 0)) {
      return
    }
    
    dinero -= cantidad
    apuesta += cantidad
    return
  }
}

class Crupier inherits Persona {
  
}