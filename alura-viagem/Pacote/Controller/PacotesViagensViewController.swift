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
    
    let listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaViagens = listaComTodasViagens
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
        
        let pacoteAtual = listaViagens[indexPath.item]
        celulaPacote.configureCelula(pacote: pacoteAtual)
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: pacotesCollectionView.bounds.width / 2 - 15, height: 160)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        listaViagens = listaComTodasViagens
        
        if (searchText != "") {
            let filtroListaViagem = NSPredicate(format: "viagem.titulo CONTAINS[cd] %@", searchText)
            let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array<PacoteViagem>
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
        let pacote = listaViagens[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhePacoteViewController
        controller.pacoteSelecionado = pacote
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
