object textoDineroDispoible {
  method image() = "dinerodisponible.png"
  
  method position() = game.at(game.center().x() - 35, 5)
}

object textoDineroDisponibleNumeros {
  var property position = game.at(63, 7)
  const property visuals = []
  
  method position(x, y) = game.at(x, y)
  
  method text(dinero) {
    // add a visual for each digit of the number (assume whole)
    game.addVisual(textoDineroDispoible)
    textoNumero.text(dinero, position, visuals)
  }
}

object textoApuesta {
  var property text = ""
  var property textColor = "#ffffff"
  
  method text(apuesta) {
    text = "Apuesta : $" + apuesta.toString()
  }
  
  method position() = game.at(5, game.height() / 2)
}

class Numero {
  var property digito
  var property position
  
  method position(x, y) = game.at(x, y)
  
  method image() = ("texto_" + digito) + ".png"
}

object textoNumero {
  method text(numero, position, visuals) {
    // add a visual for each digit of the number (assume whole)
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
  
  method removeAllVisuals(visuals) {
    visuals.forEach({ visual => game.removeVisual(visual) })
  }
}