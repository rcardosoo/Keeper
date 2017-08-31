//
//  ListarTableViewController.swift
//  Keeper
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Kepper. All rights reserved.
//

import UIKit

class ListarTableViewController: UITableViewController {
    var cadastro = Cadastro()
    var notaSelecionada: Nota!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cadastro.size()
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! NotaTableViewCell
        print("ENTROU NO METODO DE CONFIGURACAO DA CELULA")
        
        let p = self.cadastro.lista[indexPath.row]
        //self.notaSelecionada = p
        cell.lbNome.text = "\(p.titulo!)"
        cell.lbData.text = "\(p.data!)"
        cell.lbPrioridade.text = ""
        if (p.prioridade == 1) {
            cell.lbPrioridade.backgroundColor = UIColor.red
        } else {
            cell.lbPrioridade.backgroundColor = UIColor.gray
        }
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("CHEGOU NO PREPARE")
        if (segue.identifier == "listar_formulario"){
            print("ENTROU NO IF DA SEGUE")
            let fvc = segue.destination as! FormularioViewController
            fvc.cadastro = self.cadastro
            print("CADASTRO FOI PASSADO \(self.cadastro.size())")
        } else if (segue.identifier == "celula_sobre") {
            print("ENTROU NO PREPARE CELULA-SOBRE")
            print("SELECIONADA = \(self.notaSelecionada.titulo!)")
            let svc = segue.destination as! SobreViewController
            svc.nota = self.notaSelecionada!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell number: \(indexPath.row)!");
        self.notaSelecionada = self.cadastro.lista[indexPath.row]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.cadastro.del(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
