//
//  RestaurantTableViewController.swift
//  tableview
//
//  Created by jay patel on 2017-04-07.
//
//

import UIKit

class RestaurantTableViewController: UITableViewController  {
    
    var data: [feedbakdata] = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
               // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func loadData(){
        let img1 = UIImage(named: "rest1")
        let img2  = UIImage(named: "rest2")
        let img3 = UIImage(named: "rest3")
        
        let fdb1 = feedbakdata(name: "The Keg Mansion", image: img1, comment: "Very Nice Place Love To Visit again", custname: "Jay Patel")
        
        let fdb2 = feedbakdata(name: "Spring Rolls", image: img2, comment:"Nice Place", custname: "Krunal Patel")
        
        let fdb3 = feedbakdata(name: "Spring RollS", image: img3, comment: "Avg Good Staff", custname: "ManvirKaur Phull")
        
        data.append(fdb1)
        data.append(fdb2)
        data.append(fdb3)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as? RestaurantTableViewCell {
            let resta = data[indexPath.row]
        
        // Configure the cell...

        cell.lblname.text = resta.name
        cell.restimg?.image = resta.image
        cell.comment.text = resta.comment
            cell.custnam.text = resta.custname
        
        return cell
    }else{
    fatalError("Cell is Not An instance")
    }
}
        @IBAction func unwindToRestaurantList(sender: UIStoryboardSegue){
            // test if the sender is the ViewController, and if there is a restaurant created
            if let sourceViewController = sender.source as? feedback {
                if let newRestaurant = sourceViewController.feedbakd {
                    // Where the new restaurant must be added
                    let newIndexPath = IndexPath(row: data.count, section: 0)
                    
                    //adding the new restaurant to the array
                    data.append(newRestaurant)
                    
                    //adding the new element to the tableview
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
        

    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
