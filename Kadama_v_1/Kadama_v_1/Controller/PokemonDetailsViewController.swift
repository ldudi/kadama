//
//  PokemonDetailsViewController.swift
//  Kadama_v_1
//
//  Created by Labhesh Dudi on 05/03/22.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonDetailsLabel: UILabel!
    
    
    var value = 6
    var pokemon = Pokemon()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        print(value)
        pokemonImageView.image = UIImage(data: pokemon.image!)
        pokemonNameLabel.text = pokemon.name
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
