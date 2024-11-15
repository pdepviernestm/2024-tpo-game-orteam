// La persona tiene que tener una "mano" (array de cartas) y un metodo que en base al mazo general del juego, saque una carta y la agregue a su mano.
// Persona.posicion es un atributo que indica la posicion de la persona en la mesa. ({x: 0, y: 0})
import constants.*

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
  
  method puntaje() {
    var puntaje = 0
    var cantidadDeAses = 0
    mano.forEach(
      { carta =>
        const valor = carta.numero()
        if (valor == "as") {
          cantidadDeAses += 1
        } else {
          const puntajeCarta = valores.basicGet(valor)
          
          puntaje += puntajeCarta
        }
      }
    )
    
    cantidadDeAses.times(
      { _ => if ((puntaje + 11) <= 21) {
          puntaje += 11
        } else {
          puntaje += 1
        } }
    )
    
    return puntaje
  }
  
  method limpiarMano() {
    mano.forEach({ carta => game.removeVisual(carta) })
    mano.clear()
  }
}

class Jugador inherits Persona {
  var property dinero = 50
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
  
  method ganarDinero(cantidad) {
    dinero += cantidad
  }
  
  method tieneBlackjack() {
    console.println((("Puntaje: " + self.puntaje()) + ", ") + mano.size())
    return (mano.size() == 2) && (self.puntaje() == 21)
  }
}

class Crupier inherits Persona {
  
}