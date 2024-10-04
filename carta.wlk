import wollok.game.*

object mazo {
  method image() = "mazo.png"
  
  method position() = game.at(game.width() - 50, game.height() - 50)
}

class Carta {
  const palo
  const numero
  
  method getValor() {
    if (numero == 1) {
      return 11
    } else {
      if (numero > 10) {
        return 10
      } else {
        return numero
      }
    }
  }
  
  method getPath() {
    var basePath = palo + "_"
    if (numero == 1) {
      basePath += "as"
    } else {
      if (numero == 11) {
        basePath += "j"
      } else {
        if (numero == 12) {
          basePath += "q"
        } else {
          if (numero == 13) {
            basePath += "k"
          } else {
            basePath += numero.toString()
          }
        }
      }
    }
    basePath += ".jpg"
    return basePath
  }
  
  method image() = self.getPath() // method text() = self.getPath()
  
  method position() = game.center()
}