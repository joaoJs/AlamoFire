import UIKit

extension UIView {
    
    func boundToSuperView(constant: CGFloat = 8) {
        guard let safeArea = self.superview?.safeAreaLayoutGuide else { return }
        
        self.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: constant).isActive = true
        self.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -constant).isActive = true
        self.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -constant).isActive = true
    }
}
