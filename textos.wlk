object textoBotones {
  method image() = "botones.png"
  
  method position() = game.at(game.width() - 25, game.height() / 2)
}

object textoDineroDispoible {
  method image() = "dinerodisponible.png"
  
  method position() = game.at(game.center().x() - 35, 5)
}

object textoApuesta {
  method image() = "apuesta.png"
  
  method position() = game.at(5, game.height() / 2)
}

object textoPuntaje {
  method image() = "puntaje.png"
  
  method position() = game.at(20, 25)
}

object textoPuntajeNumeros {
  const numeros = new TextoNumero()
  var property position = game.at(32, 25)
  
  method position(x, y) = game.at(x, y)
  
  method text(puntaje) {
    // add a visual for each digit of the number (assume whole)
    numeros.text(puntaje, position)
  }
}

object textoDineroDisponibleNumeros {
  const numeros = new TextoNumero()
  var property position = game.at(63, 7)
  
  method position(x, y) = game.at(x, y)
  
  method text(dinero) {
    // add a visual for each digit of the number (assume whole)
    numeros.text(dinero, position)
  }
}

object textoApuestaNumeros {
  var property position = game.at(17, 52)
  const numeros = new TextoNumero()
  
  method position(x, y) = game.at(x, y)
  
  method text(dinero) {
    // add a visual for each digit of the number (assume whole)
    numeros.text(dinero, position)
  }
}

class Numero {
  var property digito
  var property position
  
  method position(x, y) = game.at(x, y)
  
  method image() = ("texto_" + digito) + ".png"
}

class TextoNumero {
  const property visuals = []
  
  method text(numero, position) {
    self.removeAllVisuals()
    const numeroString = numero.toString()
    
    numeroString.length().times(
      { i =>
        const digito = numeroString.charAt(i - 1)
        const visual = new Numero(
          digito = digito,
          position = game.at(position.x() + (i * 2), position.y())
        )
        
        visuals.add(visual)
        return game.addVisual(visual)
      }
    )
  }
  
  method removeAllVisuals() {
    visuals.forEach({ visual => game.removeVisual(visual) })
  }
}