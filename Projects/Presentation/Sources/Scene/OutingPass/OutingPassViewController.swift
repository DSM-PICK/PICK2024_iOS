import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

import Core
import DesignSystem

public class OutingPassViewController: BaseViewController<OutingPassViewModel> {
    
    private let outingPassRelay = PublishRelay<Void>()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainView = UIView()
    
    private let navigationTitleLabel = UILabel().then {
        $0.text = "외출증"
        $0.textColor = .neutral50
        $0.font = .subTitle3M
    }
    private let userInfoLabel = UILabel().then {
        $0.textColor = .neutral100
        $0.font = .subTitle1M
    }
    private let outingTypeLabel = UILabel().then {
        $0.textColor = .primary500
        $0.font = .subTitle1M
    }
    private let qrCodeImageView = UIImageView().then {
        $0.backgroundColor = .primary1200
        $0.layer.cornerRadius = 4
    }
    private let outingTimeLabel = UILabel().then {
        $0.text = "외출 시간"
        $0.textColor = .neutral50
        $0.font = .label1
    }
    private let outingTimeRangeLabel = PiCKPaddingLabel().then {
        $0.textColor = .neutral100
        $0.font = .subTitle3M
        $0.backgroundColor = .primary1200
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    private let outingReasonLabel = UILabel().then {
        $0.text = "사유"
        $0.textColor = .neutral50
        $0.font = .label1
    }
    private let outingReasonDescriptionLabel = PiCKPaddingLabel().then {
        $0.textColor = .neutral100
        $0.font = .subTitle3M
        $0.backgroundColor = .primary1200
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    private let approvedTeacherLabel = UILabel().then {
        $0.text = "확인 교사"
        $0.textColor = .neutral50
        $0.font = .label1
    }
    private let approvedTeacherNameLabel = PiCKPaddingLabel().then {
        $0.textColor = .neutral100
        $0.font = .subTitle3M
        $0.backgroundColor = .primary1200
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    public override func configureNavigationBar() {
        navigationItem.titleView = navigationTitleLabel
    }
    public override func bindAction() {
        outingPassRelay.accept(())
    }
    public override func bind() {
        let input = OutingPassViewModel.Input(
            outingPassLoad: outingPassRelay.asObservable()
        )
        let output = viewModel.transform(input: input)
        
        output.outingPassData.asObservable()
            .subscribe(
                onNext: { data in
                    self.userInfoLabel.text = "\(data.grade)\(data.classNum)\( data.num) \(data.userName)"
                    self.outingTypeLabel.text = data.type
                    self.approvedTeacherNameLabel.text = data.teacherName
                    //                    self.qrCodeImageView.image = data.image
                    self.outingTimeRangeLabel.text = "\(data.startTime) ~ \(data.endTime)"
                    self.outingReasonDescriptionLabel.text = data.reason
                    self.approvedTeacherNameLabel.text = data.teacherName
                }
            )
            .disposed(by: disposeBag)
    }
    public override func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainView)
        [
            userInfoLabel,
            outingTypeLabel,
            qrCodeImageView,
            outingTimeLabel,
            outingTimeRangeLabel,
            outingReasonLabel,
            outingReasonDescriptionLabel,
            approvedTeacherLabel,
            approvedTeacherNameLabel
        ].forEach { mainView.addSubview($0) }
    }
    public override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(self.view)
        }
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(self.view.frame.height * 1.2)
        }
        userInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.left.equalToSuperview().inset(24)
        }
        outingTypeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(24)
        }
        qrCodeImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userInfoLabel.snp.bottom).offset(32)
            $0.width.height.equalTo(342)
        }
        outingTimeLabel.snp.makeConstraints {
            $0.top.equalTo(qrCodeImageView.snp.bottom).offset(32)
            $0.left.equalToSuperview().inset(24)
        }
        outingTimeRangeLabel.snp.makeConstraints {
            $0.top.equalTo(outingTimeLabel.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(40)
        }
        outingReasonLabel.snp.makeConstraints {
            $0.top.equalTo(outingTimeRangeLabel.snp.bottom).offset(32)
            $0.left.equalToSuperview().inset(24)
        }
        outingReasonDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(outingReasonLabel.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(40)
        }
        approvedTeacherLabel.snp.makeConstraints {
            $0.top.equalTo(outingReasonDescriptionLabel.snp.bottom).offset(32)
            $0.left.equalToSuperview().inset(24)
        }
        approvedTeacherNameLabel.snp.makeConstraints {
            $0.top.equalTo(approvedTeacherLabel.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(40)
        }
    }
    
}
