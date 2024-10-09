//
//  SikhMartyrsViewController.swift
//  gurbani
//
//  Created by user247371 on 3/6/24.
//

import UIKit
import PDFKit
class SikhMartyrsViewController: UIViewController {

    var pdfviewObject:PDFView=PDFView()
    var pdfDocumentObject:PDFDocument=PDFDocument()
    var totalPageCount = 0
    
   
   
    @IBOutlet var pdfStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfviewObject = PDFView(frame: pdfStack.bounds)
        pdfStack.addSubview(pdfviewObject)
        
        guard let path = Bundle.main.url(forResource: "sikhMartyrs" , withExtension: "pdf")
        else
        {
            print("Error in PDF Path")
            return
        }
        pdfDocumentObject=PDFDocument(url: path)!
        pdfviewObject.document = pdfDocumentObject
        pdfviewObject.autoScales = true
        pdfviewObject.displayMode = .singlePage
        pdfviewObject.displayDirection = .horizontal
        pdfviewObject.usePageViewController(true)
        totalPageCount = 0
       
    
    
        
        
        
        // Add previous and next buttons
        let previousButton = UIButton(type: .system)
        previousButton.setTitle("Previous", for: .normal)
        previousButton.addTarget(self, action: #selector(previousPage), for: .touchUpInside)
        
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20) 
        previousButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)// Change 20 to whatever font size you desire
        
        // Set button frame
        nextButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        previousButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
//        let titleLabel = UILabel()
//        titleLabel.text = "Gurbani"
        
        let stackView = UIStackView(arrangedSubviews: [ previousButton, nextButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160)
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



