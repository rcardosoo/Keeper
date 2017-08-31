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
    var prioridade: Int!
    var data: String!
    
    override var description: String{
        var txtCell: String
        if (prioridade == 1) {
            txtCell = "\(self.titulo!) - A"
        } else {
            txtCell = "\(self.titulo!) - B"
        }
        
        return txtCell

    }
    
    init(titulo: String, texto: String, prioridade: Int, result: String) {
        self.titulo = titulo
        self.texto = texto
        self.prioridade = prioridade
        self.data = result
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.titulo = aDecoder.decodeObject(forKey: "titulo") as! String
        self.texto = aDecoder.decodeObject(forKey: "texto") as! String
        self.prioridade = aDecoder.decodeObject(forKey: "prioridade") as! Int
        self.data = aDecoder.decodeObject(forKey: "data") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.titulo, forKey: "titulo")
        aCoder.encode(self.texto, forKey: "texto")
        aCoder.encode(self.prioridade, forKey: "prioridade")
        aCoder.encode(self.data, forKey: "data")
    }
    

}
