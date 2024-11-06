class Numero {
  var property digito
  var property position
  
  method position(x, y) = game.at(x, y)
  
  method image() = ("texto_" + digito) + ".png"
}

class ImagenClase {
  const image
  const property position
  
  method image() = image
}

class TextoConNumeros {
  const property positionTexto
  var property image
  const property positionNumeros
  const numeros = new TextoNumero(position = positionNumeros)
  const imagen = new ImagenClase(image = image, position = positionTexto)
  
  method setNumero(dinero) {
    game.removeVisual(imagen)
    game.addVisual(imagen)
    
    numeros.text(dinero)
  }
  
  method removeVisualNumeros() {
    numeros.removeAllVisuals()
  }
  
  method addVisualTitulo() {
    game.addVisual(imagen)
  }
}

class TextoNumero {
  const property visuals = []
  const position
  
  method text(numero) {
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