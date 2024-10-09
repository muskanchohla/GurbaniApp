import UIKit

class SikhGuruViewController: UIViewController {
    
    @IBOutlet weak var SikhGuruTable: UITableView!
    
    var imageView: UIImageView!
    var guruNamesArray=["Shri Guru Nanank Dev Ji",
                        "Shri Guru Angad Dev Ji",
                        "Shri Guru Amardas Ji",
                        "Shri Guru Ramdas Ji",
                        "Shri Guru Arjan Dev Ji",
                        "Shri Guru Har Gobind Ji",
                        "Shri Guru Har Rai Ji",
                        "Shri Guru Har Krishan Ji",
                        "Shri Guru Teg Bhadar Ji",
                        "Shri Guru Gobind Singh Ji",
                        "Shri Guru Granth Sahib Ji"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SikhGuruTable.delegate = self
        SikhGuruTable.dataSource = self
        
        // Create UIImageView programmatically
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.contentMode = .scaleAspectFit
        imageView.center = view.center
        view.addSubview(imageView)
    }
}

extension SikhGuruViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guruNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var config = UIListContentConfiguration.cell()
        config.text = guruNamesArray[indexPath.row]
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Display picture for the selected row
        
        // Assuming you have an array of image names corresponding to each guru
        let imageNames = ["guru-nanak", "Guru-Angad", "guru-amardas", "guru-ramdas", "guru-arjan", "guru-hargobind", "guru-harrai", "guru-harkrishan", "guru-tegbahadur", "guru-gobindsingh", "shri-guru-granth-sahib-ji"]
        
        let selectedImageName = imageNames[indexPath.row]
        
        // Update the image of the imageView
        imageView.image = UIImage(named: selectedImageName)
    }
}
