//
//  PacoteViagem.swift
//  alura-viagem
//
//  Created by Rodrigo Luiz Duarte on 22/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {

    let nomeDoHotel:String
    let descricao:String
    let dataViagem:String
    @objc let viagem:Viagem
    
    init(nomeDoHotel: String, descricao:String, dataViagem:String, viagem:Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }
    
}
