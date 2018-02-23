//
//  ViagemTableViewCell.swift
//  alura-viagem
//
//  Created by Rodrigo Luiz Duarte on 21/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class ViagemTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!

    func configureCelula(viagem: Viagem) {
        labelTitulo?.text = viagem.titulo
        let dias = viagem.quantidadeDeDias > 1 ? "dias" : "dia"
        labelQuantidadeDeDias?.text = "\(viagem.quantidadeDeDias) \(dias)"
        labelPreco?.text = "R$ \(viagem.preco)"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        imagemViagem.layer.cornerRadius = 10
        imagemViagem.layer.masksToBounds = true
    }
}
