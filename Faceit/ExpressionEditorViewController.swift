//
//  ExpressionEditorViewController.swift
//  Faceit
//
//  Created by Denver Stove on 6/11/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class ExpressionEditorViewController: UITableViewController
{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return tableView.bounds.size.width
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
    
}
