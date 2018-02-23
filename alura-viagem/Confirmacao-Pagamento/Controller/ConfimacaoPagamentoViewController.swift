//
//  ConfimacaoPagamentoViewController.swift
//  alura-viagem
//
//  Created by Rodrigo Luiz Duarte on 22/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class ConfimacaoPagamentoViewController: UIViewController {
    
    var pacoteComprado:PacoteViagem? = nil

    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelHotel: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelQuantidadeDePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacote: UILabel!
    @IBOutlet weak var botaoVoltarPraHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagemViagem.layer.cornerRadius = 10
        self.imagemViagem.layer.masksToBounds = true
        
        self.botaoVoltarPraHome.layer.cornerRadius = 8
        
        self.exibaDadosPacote()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botaoVoltarPraHomeClick(_ sender: UIButton) {
        
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
    
    func exibaDadosPacote() {
        
        if let pacote = pacoteComprado {
            self.imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelHotel.text = pacote.nomeDoHotel
            self.labelTitulo.text = pacote.viagem.titulo.uppercased()
            self.labelDataViagem.text = pacote.dataViagem
            self.labelDescricaoPacote.text = pacote.descricao
        }
    }

}
