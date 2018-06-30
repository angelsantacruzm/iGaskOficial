//
//  OrderDetailViewController.swift
//  iGaskOficial
//
//  Created by Angel Antonio Santa Cruz Miñano on 6/30/18.
//  Copyright © 2018 Angel Antonio Santa Cruz Miñano. All rights reserved.
//

import UIKit
import FirebaseDatabase

  var myIndexOrder = 0

class OrderTableViewCell: UITableViewCell {
    
        @IBOutlet weak var productidxxx: UILabel!
        @IBOutlet weak var nameProducLabel: UILabel!
    @IBOutlet weak var quantityProductLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var orderIDLabel: UILabel!
    
}


class OrderDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    var ref:DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var orderDataAux = [OrderModel]()
    
    @IBOutlet weak var tablevieworder: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablevieworder.delegate = self
        tablevieworder.dataSource = self
        // Do any additional setup after loading the view.
        fetchOrders()
    }
    
    func fetchOrders(){
        ref = Database.database().reference()
        databaseHandle = ref?.child("orders").observe(.childAdded, with: { (DataSnapshot) in
            if let dictionary = DataSnapshot.value as? [String: AnyObject]{
                let order = OrderModel()
                order.idCustomer = dictionary["idCustomer"] as! String
                order.price = dictionary["price"] as! String
                order.quantity = dictionary["quantity"] as! String
                order.date = dictionary["date"] as! String
                order.idOrder = dictionary["idOrder"] as! String
                order.idProduct = dictionary["idProduct"] as! String
                self.orderDataAux.append(order)
                DispatchQueue.main.async {
                    self.tablevieworder.reloadData()
                }
                
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderDataAux.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OrderTableViewCell
        let orders = orderDataAux[indexPath.row]
        cell.productidxxx.text = orders.date
        cell.nameProducLabel.text = orders.idProduct
        cell.totalPriceLabel.text = orders.price
        cell.quantityProductLabel.text = orders.quantity
        cell.orderIDLabel.text = orders.idOrder
        //cell?.detailTextLabel?.text = orders.idProduct
        //cell.dateLabelCell.text = orders.date
        //cell.ordernumberLabelCell.text = orders.idOrder
        //cell.quantityLabelCell.text = orders.quantity
        //cell.totalpriceLabelCell.text = orders.price
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        tablevieworder.estimatedRowHeight = 164
        tablevieworder.rowHeight = 164
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
