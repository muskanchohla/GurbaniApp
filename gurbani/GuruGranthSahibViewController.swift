import UIKit
import PDFKit

class GuruGranthSahibViewController: UIViewController {
    var pdfviewObject: PDFView = PDFView()
    var originalPDFDocument: PDFDocument?
    var translatedPDFDocument: PDFDocument?
    var isTranslated: Bool = false
    var totalPageCount = 0
    var currentPageNumber = 1 // Variable to store the current page number

    @IBOutlet var pdfViewStack: UIStackView!
    var translateButton: UIButton! // Declare translateButton as a property of the class

    override func viewDidLoad() {
        super.viewDidLoad()
        pdfviewObject = PDFView(frame: pdfViewStack.bounds)
        pdfViewStack.addSubview(pdfviewObject)

        guard let originalPath = Bundle.main.url(forResource: "japjisahib", withExtension: "pdf"),
              let translatedPath = Bundle.main.url(forResource: "Japji-Sahib-GRE", withExtension: "pdf") else {
            print("Error in PDF Paths")
            return
        }

        originalPDFDocument = PDFDocument(url: originalPath)
        translatedPDFDocument = PDFDocument(url: translatedPath)

        pdfviewObject.document = originalPDFDocument
        pdfviewObject.autoScales = true
        pdfviewObject.displayMode = .singlePage
        pdfviewObject.displayDirection = .horizontal
        pdfviewObject.usePageViewController(true)
        totalPageCount = originalPDFDocument?.pageCount ?? 0

        translateButton = UIButton(type: .system)
        translateButton.setTitle("Translated", for: .normal)
        translateButton.addTarget(self, action: #selector(toggleTranslator), for: .touchUpInside)

        let previousButton = UIButton(type: .system)
        previousButton.setTitle("Previous", for: .normal)
        previousButton.addTarget(self, action: #selector(previousPage), for: .touchUpInside)

        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [previousButton, translateButton, nextButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
        ])
    }

    @objc func toggleTranslator() {
        if isTranslated {
            pdfviewObject.document = originalPDFDocument
            translateButton.setTitle("Translate", for: .normal) // Update button title to "Translate"
        } else {
            pdfviewObject.document = translatedPDFDocument
            translateButton.setTitle("Original", for: .normal) // Update button title to "Original"
        }
        // Restoring the current page after toggling
        pdfviewObject.go(to: (pdfviewObject.document?.page(at: currentPageNumber - 1))!)
        isTranslated.toggle()
    }

    @objc func previousPage() {
        guard pdfviewObject.canGoToPreviousPage else {
            return
        }
        pdfviewObject.goToPreviousPage(nil)
        currentPageNumber = max(1, currentPageNumber - 1) // Update current page number
    }

    @objc func nextPage() {
        guard pdfviewObject.canGoToNextPage else {
            return
        }
        pdfviewObject.goToNextPage(nil)
        currentPageNumber = min(totalPageCount, currentPageNumber + 1) // Update current page number
    }
}

