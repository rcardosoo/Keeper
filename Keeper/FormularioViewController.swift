//
//  FormularioViewController.swift
//  Keeper
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Kepper. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController {
    
    @IBOutlet weak var etTitulo: UITextField!
    @IBOutlet weak var tfTexto: UITextView!
    @IBOutlet weak var swPrioridade: UISwitch!
    
    var cadastro: Cadastro!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    
    @IBAction func salvar(_ sender: AnyObject) {
        let titulo = self.etTitulo.text
        let texto = self.tfTexto.text
        let prioridade = self.swPrioridade.isOn
        
        
        let nota = Nota(titulo: titulo!, texto: texto!, prioridade: prioridade)
        
        self.cadastro.add(nova: nota)
        
        //self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
