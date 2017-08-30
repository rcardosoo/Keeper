//
//  Nota.swift
//  Keeper
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Kepper. All rights reserved.
//

import Foundation

class Nota: NSObject, NSCoding {
    var titulo: String!
    var texto: String!
    var prioridade: Bool!
    var data: String!
    
    override var description: String{
        return "\(self.titulo!) -  \(self.prioridade!)"
    }
    
    init(titulo: String, texto: String, prioridade: Bool) {
        self.titulo = titulo
        self.texto = texto
        self.prioridade = prioridade
        let data = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: data)
        self.data = result
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.titulo = aDecoder.decodeObject(forKey: "titulo") as! String
        self.texto = aDecoder.decodeObject(forKey: "texto") as! String
        self.prioridade = aDecoder.decodeObject(forKey: "prioridade") as! Bool
        self.data = aDecoder.decodeObject(forKey: "data") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.titulo, forKey: "titulo")
        aCoder.encode(self.texto, forKey: "texto")
        aCoder.encode(self.prioridade, forKey: "prioridade")
        aCoder.encode(self.data, forKey: "data")
    }
    

}
