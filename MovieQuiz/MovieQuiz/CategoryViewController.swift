//
//  TableViewController.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 3/6/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController, UISearchBarDelegate {
    var movieStore: MovieStore!
    var currentMovieStore = [MovieStore]()
    var typeArray = [nameType]() // to set up table
    var currenttypeArray = [nameType]()
    var isSearching = false
    var movies: [Movie] = []

    
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    private func setUpType(){
        //GENRE
        typeArray.append(nameType(images: "action.png", name: "Action", type: .gerne))
        typeArray.append(nameType(images: "animation.png", name: "Animation", type: .gerne))
        typeArray.append(nameType(images: "crime.png", name: "Crime", type: .gerne))
        typeArray.append(nameType(images: "comedy.png", name: "Comedy", type: .gerne))
        typeArray.append(nameType(images: "drama.png", name: "Drama", type: .gerne))
        typeArray.append(nameType(images: "fantasy.png", name: "Fantasy", type: .gerne))
        typeArray.append(nameType(images: "horror.png", name: "Horror", type: .gerne))
        typeArray.append(nameType(images: "scifi.png", name: "Sci-Fi", type: .gerne))
        typeArray.append(nameType(images: "romantic.png", name: "Romantic", type: .gerne))

        //Actor
        typeArray.append(nameType(images: "bradpitt.png", name: "Brad-Pitt", type: .actor))
        typeArray.append(nameType(images: "jackiechan.png", name: "Jackie Chan", type: .actor))
        typeArray.append(nameType(images: "jasonstatham.png", name: "Jason Statham", type: .actor))
        typeArray.append(nameType(images: "tomcruise.png", name: "Tom Cruise", type: .actor))

        //typeArray.append(nameType(images: "action.png", name: "Romantic", type: .gerne))

        //YEAR
        typeArray.append(nameType(images: "action.png", name: "80s", type: .year))
        typeArray.append(nameType(images: "action.png", name: "90s", type: .year))

        //Set currentTypeArray = typeArray
        currenttypeArray = typeArray
    }
    
    //Set Up Search Bar
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    //Set Text Search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        //if searchtext is emoty, reload data
        guard !searchText.isEmpty else{
            currenttypeArray = typeArray
            table.reloadData()
            return
        }
        currenttypeArray = typeArray.filter({ type -> Bool in
             type.name.lowercased().contains(searchText.lowercased())
        })
        //Reload Data after search
        table.reloadData()

    }
    
    //Set Scope Search, based on category gerne, actors, year
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        switch selectedScope {
        case 0:
            currenttypeArray = typeArray
        case 1:
            currenttypeArray = typeArray.filter({ movie -> Bool in
                movie.type == movieCategory.gerne
            })
        case 2:
            currenttypeArray = typeArray.filter({ movie -> Bool in
                movie.type == movieCategory.actor
            })
        case 3:
            currenttypeArray = typeArray.filter({ movie -> Bool in
                movie.type == movieCategory.year
            })
        default:
            break
        }
        table.reloadData()
    }
    
    
    //Read data from CSV file
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
    
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpType()
        setUpSearchBar()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        
        //Read Data from CSV
        let name = "listMovie"
        let ex = "csv"
        var data = readDataFromCSV(fileName: name, fileType: ex)
        data = cleanRows(file: data!)
        var csvRows = csv(data: data!)
    
        csvRows.remove(at: csvRows.count - 1)
        
        for i in 0 ..< csvRows.count{
            movies.append(Movie(images: csvRows[i][0], title: csvRows[i][1], type: csvRows[i][2]))
        }
        
        print(movies[0].images)
    }
    
    
    //Number of Type Rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenttypeArray.count
       // return movieStore.typeMovie[section].count
    }
    
    //Show all cell with movie types
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
       
        let movieType = currenttypeArray[indexPath.row].name
        let movieTypePhoto = currenttypeArray[indexPath.row].images
        //let movieType = movieStore.typeMovie[indexPath.section][indexPath.row]
      // let movieTypePhoto = movieStore.movieTypePhoto[indexPath.section][indexPath.row]
   
        //TO DO : NEED TO ADD MORE IMAGES FOR TYPE
        
        //cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.nameLabel.text = movieType
        cell.imageType.image = UIImage(named: movieTypePhoto)
        cell.imageType.layer.cornerRadius = cell.imageType.frame.height / 2
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped

            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let detailViewController
                = segue.destination as! DetailViewController
            //detailViewController.name = movieStore.typeMovie[indexPath.section][indexPath.row]
            detailViewController.name = currenttypeArray[indexPath.row].name
           // detailViewController.actionType = movies
            detailViewController.allMovies.movies = movies
            
        //TO-DO: PASSING VALUE FROM HERE TO THE OTHER, ADD MORE TYPEs
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    

    
    
}
