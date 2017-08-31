//
//  SobreViewController.swift
//  Keeper
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Kepper. All rights reserved.
//

import UIKit

class SobreViewController: UIViewController {
    var nota: Nota!
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbData: UILabel!
    @IBOutlet weak var tfTexto: UITextView!
    @IBOutlet weak var lbPrioridade: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CHEGOU A NOTA: \(self.nota.titulo!)")
        self.lbTitulo.text = self.nota.titulo
        self.lbData.text = self.nota.data
        self.tfTexto.text = self.nota.texto
        if (self.nota.prioridade == 1) {
             self.lbPrioridade.text = "ALTA"
        } else {
            self.lbPrioridade.text = "BAIXA"
        }
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
