//
//  ListViewController.swift
//  Forecapp
//
//  Created by thunderduck on 03/08/2021.
//

import UIKit

// Custom Cell with Subtitle
class SubtitleTableViewCell : UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: CLASS
class ListViewController: UITableViewController {
    
    var viewModel: ListViewModel!
    private let cellReuseId = "cellreuseid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: cellReuseId)
        viewModel.update()
    }
}


// MARK: EXTENSION TABLE VIEW
extension ListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getTableViewNumberRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! SubtitleTableViewCell
        cell.textLabel?.text = viewModel.getCellText(cell: indexPath.row)
        cell.detailTextLabel?.text = viewModel.getCellDetails(cell: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        viewModel.showObservationDetail(cell: indexPath.row)
   }
}

// MARK: DELEGATE EXTENSION
extension ListViewController: ListViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}
