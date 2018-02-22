//
//  PacotesViagensViewController.swift
//  alura-viagem
//
//  Created by Rodrigo Luiz Duarte on 21/02/2018.
//  Copyright © 2018 Rodrigo Luiz Duarte. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout,
                                    UISearchBarDelegate {

    @IBOutlet weak var pacotesCollectionView: UICollectionView!
    @IBOutlet weak var searchBarPacotes: UISearchBar!
    @IBOutlet weak var labelPacotesEncontrados: UILabel!
    
    let listaComTodasViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelPacotesEncontrados.text = self.atuslizaLabelPacotesEncontrados()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagem = listaViagens[indexPath.row]
        
        celulaPacote.labelTitulo.text = viagem.titulo
        celulaPacote.labelQuantidadeDeDias.text = "\(viagem.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(viagem.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 10
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: pacotesCollectionView.bounds.width / 2 - 15, height: 160)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        listaViagens = listaComTodasViagens
        
        if (searchText != "") {
            let filtroListaViagem = NSPredicate(format: "titulo CONTAINS[cd] %@", searchText)
            let listaFiltrada:Array<Viagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array<Viagem>
            listaViagens = listaFiltrada
            print(listaFiltrada)
        }
        
        self.labelPacotesEncontrados.text = self.atuslizaLabelPacotesEncontrados()
        pacotesCollectionView.reloadData()
    }
    
    func atuslizaLabelPacotesEncontrados() -> String {
        
        if (listaViagens.count == 0) {
            return "Nenhum pacote encontrado"
        } else {
            return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhePacoteViewController
        self.present(controller, animated: true, completion: nil)
    }
}
