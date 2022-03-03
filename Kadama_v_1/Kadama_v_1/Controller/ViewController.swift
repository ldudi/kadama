//
//  ViewController.swift
//  Kadama_v_1
//
//  Created by Kapil Dev on 13/06/21.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tvTableView: UITableView!
    
    
    var tableView: UITableView!
    var pokemonForCells = [Pokemon]()
    var sortMethod = true
    var searchBar = UISearchBar()
//    var navBar = UINavigationBar()
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
        setupNavbar()
        setupTableView()
        checkCoredata()
        searchBar.delegate = self
    }
    
    func setupNavbar() {
//        navBar.frame = CGRect(x: 0, y: 44, width: view.frame.size.width, height: 44)
//        view.addSubview(navBar)
//        navBar.barTintColor = .lightGray
        let navItem = UINavigationItem(title: "Pokemon")
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchClicked))
        let sortItem = UIBarButtonItem(title: "sort", style: .done, target: nil, action: #selector(sortPokemonList))
        navItem.rightBarButtonItem = searchItem
        navItem.leftBarButtonItem = sortItem
//        navBar.setItems([navItem], animated: false)
        
        navigationBar.setItems([navItem], animated: false)
        
    }
    
    @objc func searchClicked() {
        searchBar.frame = CGRect(x: 0, y: 44, width: view.frame.size.width, height: 44)
//        navBar.removeFromSuperview()
        navigationBar.isHidden.toggle()
        view.addSubview(searchBar)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.removeFromSuperview()
//        view.addSubview(navBar)
        navigationBar.isHidden.toggle()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchPokemon(query: searchText)
    }
    
    // MARK :- Search button clicked
    @objc func searchPokemon(query: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pokemon")
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS[cd] %@", query)
        do {
            let results = try managedContext.fetch(fetchRequest)
            pokemonForCells = results as! [Pokemon]
        } catch { print("error in searching")}
//        tableView.reloadData()
        tvTableView.reloadData()
        if pokemonForCells.count != 0 {
            let indexPath = IndexPath(row: 0, section: 0)
//            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            tvTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    // MARK :- sort button clicked
    @objc func sortPokemonList() {
        if sortMethod {
            pokemonForCells.sort(by: { $0.name! < $1.name!})
            sortMethod = !sortMethod
        } else {
            pokemonForCells.sort(by: { $0.id < $1.id})
            sortMethod = !sortMethod
        }
//        tableView.reloadData()
        tvTableView.reloadData()
        if pokemonForCells.count != 0 {
            let indexPath = IndexPath(row: 0, section: 0)
//            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            tvTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    // MARK :- call on app launch
    func checkCoredata() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pokemon")
        var count = 0
        do {
            count = try managedContext.count(for: fetchRequest)
        } catch {
            print("error catched")
        }
        if count == 0 {
            getPokemon()
        } else {
            retriveData()
        }
    }
    
    // MARK :- retrive data from local storage
    @objc func retriveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pokemon")
        do {
            let result = try managedContext.fetch(fetchRequest)
            pokemonForCells = result as! [Pokemon]
        } catch { print("error in fetching") }
//        tableView.reloadData()
        tvTableView.reloadData()
        refreshController.endRefreshing()
    }
    
    // MARK :- retrive ten pokeon from API details if local storage is saved
    func getTenPokemon() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=10")!
        let task = URLSession.shared.dataTask(with: url) { [self] ( data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PokemonList.self, from: data)
                
                for pokemon in response.results {
                    getPokemonDetails(url: pokemon.url)
                }
            } catch { print("error decoding JSON") }
        }
        task.resume()
    }
    
    // MARK :- get JSON formate Pokemon list
    func getPokemon() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=300")!
        let task = URLSession.shared.dataTask(with: url) { [self] ( data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PokemonList.self, from: data)
                
                for pokemon in response.results {
                    getPokemonDetails(url: pokemon.url) // download details of pokemon from API endpoint
                }
            } catch { print("error decoding JSON") }
        }
        task.resume()
    }
    
    // MARK :- download details of pokemon from API endpoint
    func getPokemonDetails(url: String) {
        let pokemonURL = URL(string: url)!
        let task = URLSession.shared.dataTask(with: pokemonURL) { [self] ( data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PokemonDetails.self, from: data)
                // save response as data model
                let name = response.name
                let id = response.id
                let count = response.abilities.count
                var abilities = [String]()
                // save abilites of pokemon
                for i in 0..<count {
                    abilities.append((response.abilities[i].ability?.name)!)
                }
                
                var pokemonImage = UIImage()
                let imageURL = URL(string: response.sprites.front_shiny)
                guard let imageData = try? Data(contentsOf: imageURL!) else { return }
                pokemonImage = UIImage(data: imageData)!
                
                DispatchQueue.main.async {
                    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                    let managedContext = appDelegate.persistentContainer.viewContext
                    
                    // MARK :- if Pokemon already exists
                    let fetchRequest = NSFetchRequest<Pokemon>(entityName: "Pokemon")
                    fetchRequest.predicate = NSPredicate.init(format: "name = %@", name)
                    
                    do {
                        let result = try managedContext.fetch(fetchRequest)
                        if result.count == 0 {
                            let pokemonEntity = NSEntityDescription.entity(forEntityName: "Pokemon", in: managedContext)!
                            let newPokemon = NSManagedObject(entity: pokemonEntity, insertInto: managedContext)
                            newPokemon.setValue(name, forKey: "name")
                            newPokemon.setValue(id, forKey: "id")
                            newPokemon.setValue(abilities, forKey: "ability")
                            newPokemon.setValue(pokemonImage.pngData(), forKey: "image")
                            pokemonForCells.append(newPokemon as! Pokemon)
                            do {
                                try managedContext.save()
                            } catch let error as NSError{
                                print("error happened", error)
                            }
//                            tableView.reloadData()
                            tvTableView.reloadData()
                        }
                    } catch { print("error") }
                }
            } catch { print("error found") }
            DispatchQueue.main.async {
//                tableView.reloadData()
                tvTableView.reloadData()
            }
        }
        task.resume()
    }
    
    func setupTableView() {
//        tableView = UITableView(frame: view.frame)
//        tableView.backgroundColor = .lightGray
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(tableView)
//        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: "PokemonListTableViewCellIdentifier")
//        tableView.register(UINib(nibName: "PokemonListTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonListTableViewCellIdentifier")
//        refreshController.attributedTitle = NSAttributedString(string: "Pull to refresh")
//        refreshController.addTarget(self, action: #selector(retriveData), for: .valueChanged)
//        tableView.addSubview(refreshController)
        
        
        tvTableView.dataSource = self
        tvTableView.delegate = self
        tvTableView.register(UINib(nibName: "PokemonListTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonListTableViewCellIdentifier")
        tvTableView.addSubview(refreshController)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonForCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonListTableViewCellIdentifier", for: indexPath) as? PokemonListTableViewCell else { return UITableViewCell()}
        
        guard let cell = self.tvTableView.dequeueReusableCell(withIdentifier: "PokemonListTableViewCellIdentifier") as? PokemonListTableViewCell else {
            return UITableViewCell()
        }
        let pokemon = pokemonForCells[indexPath.row]
        cell.setupPokemon(pokemon: pokemon)
//        cell.pokemonImage.image = UIImage(data: pokemonForCells[indexPath.row].image!)
//        cell.pokemonName.text = pokemonForCells[indexPath.row].name!.uppercased()
//        cell.pokemonId.text = String(pokemonForCells[indexPath.row].id)
//        cell.pokemonAbilities.text = "Abilities: " + (pokemonForCells[indexPath.row].ability?.joined(separator: ", "))!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

