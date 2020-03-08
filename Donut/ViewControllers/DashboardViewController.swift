import UIKit

class DashboardViewController: UIViewController {
    
    //MARK: - Properties
    let donutShape = DonutShape.configure()
    let viewModel = DashboardViewModel(networkManager: NetworkManager())
    
    lazy var creditScoreTitleLabel: UILabel = {
        return configureLabel(with: viewModel.creditScoreTitleText())
    }()
    lazy var currentCreditScoreLabel: UILabel = {
        return configureLabel(with: viewModel.currentCreditScoreText(), textColor: .orange, fontSize: 60, fontWeight: .thin)
    }()
    lazy var maxCreditScoreLabel: UILabel = {
        return configureLabel(with: viewModel.maxCreditScoreText())
    }()
    
    //MARK:- View Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title()
        fetchCreditScoreData()
    }
    
    func fetchCreditScoreData() {
        showLoadingAlert()
        viewModel.getCreditScore { [weak self] (error) in
            self?.dismissLoadingAlert()
            if let error = error, let action = self?.fetchCreditScoreData {
                self?.showErrorAlert(with: error, action: action)
                return
            } else {
                DispatchQueue.main.async {
                    self?.configureDonut()
                }
            }
        }
    }
    
    //MARK:- Donut configuration
    func configureDonut() {
        view.addSubview(configureCreditScoreLabelsStackView())
        donutShape.borderLayer.position = view.center
        view.layer.addSublayer(donutShape.borderLayer)
        donutShape.donutLayer.position = view.center
        view.layer.addSublayer(donutShape.donutLayer)
        animateDonutProgress()
    }
    
    func configureCreditScoreLabelsStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.frame = CGRect(x: 0, y: 0, width: 180, height: 120)
        stackView.center = view.center
        stackView.addArrangedSubview(creditScoreTitleLabel)
        stackView.addArrangedSubview(currentCreditScoreLabel)
        stackView.addArrangedSubview(maxCreditScoreLabel)
        return stackView
    }
    
    func animateDonutProgress() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = viewModel.creditScorePercentage()
        basicAnimation.duration = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        donutShape.donutLayer.add(basicAnimation, forKey: "basicDonutAnimation")
    }
    
    //MARK: - Label Configuration
    func configureLabel(with text: String?, textColor: UIColor = .black, fontSize: CGFloat = 20, fontWeight: UIFont.Weight = .regular) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        return label
    }
}

