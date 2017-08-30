//
//  Cadastro.swift
//  Keeper
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Kepper. All rights reserved.
//

import Foundation

class Cadastro: NSObject{
    var lista: Array<Nota>!
    
    override init() {
        super.init()
        
        let obj = NSKeyedUnarchiver.unarchiveObject(withFile: self.arquivo())
        if (obj != nil) {
            self.lista = obj as! Array<Nota>
        } else {
            self.lista = Array<Nota>()
        }
    }
    
    func arquivo() -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        return "\(path)/notas.dat"
    }
    
    func salvar() {
        NSKeyedArchiver.archiveRootObject(self.lista, toFile: self.arquivo())
    }
    
    func add(nova: Nota) {
        self.lista.append(nova)
        self.salvar()
    }
    
    func get(index: Int) -> Nota {
        return self.lista[index]
    }
    
    func size() -> Int{
        return self.lista.count
    }
    

    func del(index: Int) {
        self.lista.remove(at: index)
        self.salvar()
    }
    
    func move(origem: Int, destino: Int){
        let aux = self.lista[origem]
        self.lista[origem] = self.lista[destino]
        self.lista[destino] = aux
        self.salvar()
    }
}
