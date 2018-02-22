//
//  DetalhePacoteViewController.swift
//  alura-viagem
//
//  Created by Rodrigo Luiz Duarte on 22/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class DetalhePacoteViewController: UIViewController {
    
    var pacoteSelecionado:PacoteViagem? = nil

    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTituloViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacote: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mostreInformacoesPacote()
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: .UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mostreInformacoesPacote() {
        
        if let pacote = self.pacoteSelecionado {
            imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            labelTituloViagem.text = pacote.viagem.titulo
            labelDescricaoPacote.text = pacote.descricao
            labelQuantidadeDeDias.text = "\(pacote.viagem.quantidadeDeDias) dias"
            labelDataViagem.text = pacote.dataViagem
            labelPrecoViagem.text = pacote.viagem.preco
        }
    }
    
    @IBAction func btnVoltarClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func aumentarScroll(notification: Notification) {
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
}
