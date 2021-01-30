import UIKit


enum Genero {
    case masculino,femenino,persona
}

struct Humano{
    var nombre: String
    var paisOrigen: String
    var genero: Genero
}

let humanoPromedio = Humano(nombre: "Armando", paisOrigen: "Mexico", genero: .masculino)

class Profesor {

    var nombre: String = ""
    var escula: String = ""
}

class JulioProfe: Profesor {
    
}

extension Profesor{
    
    func educa() {
        print("El enseña muy bien")
    }
}


let profesorEducativo = JulioProfe()
profesorEducativo.nombre = "Julio"
profesorEducativo.escula = "Youtube"
profesorEducativo.educa()

