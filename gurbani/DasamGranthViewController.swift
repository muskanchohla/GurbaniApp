import UIKit
import PDFKit

class DasamGranthViewController: UIViewController {
    var pdfviewObject:PDFView=PDFView()
    var pdfDocumentObject:PDFDocument=PDFDocument()
    var totalPageCount = 0
    var currentPageNumber = 0
    
    @IBOutlet weak var stackPdfView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // pdfviewObject = PDFView(frame: self.view.bounds)
       // self.view.addSubview(pdfviewObject)
        
        pdfviewObject = PDFView(frame: stackPdfView.bounds)
        stackPdfView.addSubview(pdfviewObject)
        
        guard let path = Bundle.main.url(forResource: "jappsahib", withExtension: "pdf") else {
            print("Error in PDF Path")
            return
        }
        
        pdfDocumentObject = PDFDocument(url: path)!
        pdfviewObject.document = pdfDocumentObject
        pdfviewObject.autoScales = true
        pdfviewObject.displayMode = .singlePage
    
        pdfviewObject.displayDirection = .horizontal
        pdfviewObject.usePageViewController(true)
        //pdfviewObject.displaysAsBook = true
        totalPageCount = pdfDocumentObject.pageCount
        
        
        // Add previous and next buttons
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("Previous", for: .normal)
        previousButton.addTarget(self, action: #selector(previousPage), for: .touchUpInside)
        
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
//        let titleLabel = UILabel()
//        titleLabel.text = "Gurbani"
        
        let stackView = UIStackView(arrangedSubviews: [previousButton, nextButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
        ])
    }
    

    
    @objc func previousPage() {
        guard pdfviewObject.canGoToPreviousPage 
        else {
            return
        }
       pdfviewObject.goToPreviousPage(nil)

    }
    
    @objc func nextPage() {
        guard pdfviewObject.canGoToNextPage 
        else {
            return
        }
        pdfviewObject.goToNextPage(nil)

    }
    
  
}

