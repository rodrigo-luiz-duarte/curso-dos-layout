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
    @IBOutlet weak var textFieldDataValidadeCartao: UITextField!
    
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
        if let navigation = self.navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @objc func aumentarScroll(notification: Notification) {
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
    
    @IBAction func aoIniciarEdicaoDataValidade(_ sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @objc func exibeDataTextField(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy"
        self.textFieldDataValidadeCartao.text = formatador.string(from: sender.date)
    }
    
    @IBAction func btnFinalizarCompraClick(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfimacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
