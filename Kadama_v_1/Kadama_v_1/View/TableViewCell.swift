//
//  TableViewCell.swift
//  Kadama_v_1
//
//  Created by Kapil Dev on 13/06/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let view = UIView()
    var navigationBar: UINavigationBar!
    let pokemonImage = UIImageView()
    let pokemonName = UILabel()
    let pokemonNumber = UILabel()
    let pokemonAbilities = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCardView()
        self.backgroundColor = .clear
        view.backgroundColor = .darkGray
        
        pokemonName.textColor = .white
        pokemonName.font = UIFont.boldSystemFont(ofSize: 19)
        pokemonAbilities.numberOfLines = 0
        pokemonAbilities.textColor = .white
        pokemonAbilities.font = UIFont.systemFont(ofSize: 15)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        pokemonAbilities.translatesAutoresizingMaskIntoConstraints = false
        pokemonNumber.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        contentView.addSubview(view)
        view.addSubview(pokemonImage)
        view.addSubview(pokemonName)
        view.addSubview(pokemonAbilities)
        view.addSubview(pokemonNumber)
        
        NSLayoutConstraint.activate([pokemonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                        pokemonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                        pokemonImage.widthAnchor.constraint(equalToConstant: 80),
                                        pokemonImage.heightAnchor.constraint(equalToConstant: 80)])
        
        NSLayoutConstraint.activate([pokemonName.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 20),
                                     pokemonName.trailingAnchor.constraint(equalTo: pokemonNumber.leadingAnchor, constant: 20),
                                     pokemonName.topAnchor.constraint(equalTo: pokemonImage.topAnchor, constant: 18),
                                     pokemonName.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([pokemonNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     pokemonNumber.topAnchor.constraint(equalTo: pokemonImage.topAnchor, constant: 5),
                                     pokemonNumber.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([pokemonAbilities.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 2),
                                     pokemonAbilities.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 20),
                                     pokemonAbilities.bottomAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
                                     pokemonAbilities.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)])
        
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                                     view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                     view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                                     view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)])
    }
    
    func setupCardView() {
        view.layer.cornerRadius = 1
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 10)
        
        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
