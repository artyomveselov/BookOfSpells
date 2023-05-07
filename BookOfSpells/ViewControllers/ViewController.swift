//
//  ViewController.swift
//  BookOfSpells
//
//  Created by Артём Веселов on 07.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let linkAPI = URL(string: "https://hp-api.onrender.com/api/spells")!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSpells()
    }

    private func fetchSpells() {
        URLSession.shared.dataTask(with: linkAPI) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let spells = try decoder.decode([Spell].self, from: data)
                print(spells)
            } catch {
                print(error)
            }
        }.resume()
    }
    
}

