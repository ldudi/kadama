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
    let shadowRect = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        
        shadowRect.layer.masksToBounds = false
        shadowRect.layer.shadowColor = UIColor.black.cgColor
//        shadowRect.layer.cornerRadius = 20
        shadowRect.layer.shadowOffset = CGSize(width: 0, height: 20)
        shadowRect.layer.shadowRadius = 10
        shadowRect.layer.shadowOpacity = 0.5
        shadowRect.backgroundColor = .cyan
//        shadowRect.layer.shadowPath = UIBezierPath(roundedRect: shadowRect.bounds, cornerRadius: 20).cgPath
//        shadowRect.layer.shouldRasterize = true
//        shadowRect.layer.rasterizationScale = UIScreen.main.scale
        
        
        shadowRect.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        contentView.addSubview(shadowRect)
        
        
        
//        createRect()
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
        
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55),
                                     view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -55)])
        
        NSLayoutConstraint.activate([shadowRect.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55),
                                     shadowRect.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     shadowRect.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     shadowRect.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -55)])
        
        
        
    }
    
    func createRect() {
//        view.layer.cornerRadius = 1
//        view.layer.masksToBounds = true
//        view.layer.shadowColor = UIColor.darkGray.cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: 3)
//        view.layer.shadowOpacity = 0.5
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor.lightGray.cgColor
        
        
        // Rectangle 5
        
        
        
//        cellRect.frame = view.bounds
//        cellRect.backgroundColor = .green
//
//        let shadows = UIView()
//        shadows.frame = cellRect.frame
//        shadows.clipsToBounds = false
//        cellRect.addSubview(shadows)
//
//        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 108)
//        let layer0 = CALayer()
//        layer0.shadowPath = shadowPath0.cgPath
//        layer0.shadowColor = UIColor(red: 0.553, green: 0.106, blue: 1, alpha: 0.07).cgColor
//        layer0.shadowOpacity = 1
//        layer0.shadowRadius = 90
//        layer0.shadowOffset = CGSize(width: 0, height: 3)
//        layer0.bounds = shadows.bounds
//        layer0.position = shadows.center
//        shadows.layer.addSublayer(layer0)
//
//        let shapes = UIView()
//        shapes.frame = cellRect.frame
//        shapes.clipsToBounds = true
//        cellRect.addSubview(shapes)
//
//        let layer1 = CALayer()
//        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
//        layer1.bounds = shapes.bounds
//        layer1.position = shapes.center
//        shapes.layer.addSublayer(layer1)
//
//        shapes.layer.cornerRadius = 108
//        view.addSubview(cellRect)
//
//        print("is it working")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
