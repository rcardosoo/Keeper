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
    
    @IBAction func btEnviar(_ sender: AnyObject) {
        // texto para compartilhamento
        let text = self.tfTexto.text!
        //let text2 = "Lorem ispnum ytea fhilomun dotuns."
        //print("\(text)")
        
        // Configurar controlador de exibição de atividade
        //let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        //activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        navigationController?.present(activityViewController, animated: true) {
            // ...
        }
        
        // excluindo alguns app
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
    }
    var cadastro: Cadastro!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(salvar))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func salvar(_ sender: AnyObject) {
        let titulo = self.etTitulo.text
        let texto = self.tfTexto.text
        let prioridade = self.swPrioridade.isOn
        
        var prio:  Int
        
        
        if (prioridade == true){
            prio = 1
        }else{
            prio = 0
        }
        
        let data = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: data)
        
        let nota = Nota(titulo: titulo!, texto: (texto)!, prioridade: prio, result: result)
        
        //print("\(nota)")
        
        if (self.cadastro == nil) {
            print("CADAStro eh nil")
        }
        self.cadastro.add(nova: nota)
        
        
        self.navigationController?.popViewController(animated: true)
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
