import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(with errorMessage: String, action: @escaping () -> Void) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: "An error occured", message: errorMessage, preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default) {
                UIAlertAction in
                action()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(retryAction)
            alertController.addAction(cancelAction)
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showLoadingAlert() {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: nil, message: "Credit score loading...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
            loadingIndicator.startAnimating();
            alert.view.addSubview(loadingIndicator)
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func dismissLoadingAlert() {
        DispatchQueue.main.async { [weak self] in
            self?.dismiss(animated: false, completion: nil)
        }
    }
}
