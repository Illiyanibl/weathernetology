//
//  MainViewTableExtension.swift
//  weatherNetology
//
//  Created by Illya Blinov on 29.02.24.
//

import UIKit
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    

}
