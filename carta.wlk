import wollok.game.*

object mazoVisual {
  method image() = "mazo.png"
  
  method position() = game.at(game.width() - 50, game.height() - 50)
}

class Carta {
  var position = game.center()
  const palo
  const property numero
  
  method getPath() = ((palo + "_") + numero) + ".jpg"
  
  method image() = self.getPath() // method text() = self.getPath()
  
  method position() = position
  
  method position(newPos) {
    position = newPos
  }
}