//
//  MainViewController.swift
//  weatherNetology
//
//  Created by Illya Blinov on 28.02.24.
//

import UIKit
protocol IMainViewController: AnyObject {
    func setTitle(title: String)
    func setWeather(weather : [String])
}

final class MainViewController : UIViewController, IMainViewController{
    let viewColor = UIColor(hex: "#204EC7")
    let textMain = UIColor(hex: "#272722")
    let whiteColor = UIColor(hex: "#FFFFFF")
    let yelowColor = UIColor(hex: "#F6DD01")
    let borderColor = UIColor(hex: "#ABBCEA")

    var mainPresenter: IMainPresenter

    lazy var mainViewCollection: UICollectionView = {
        let loyut = UICollectionViewFlowLayout()
        loyut.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: loyut)
        collection.dataSource = self
        collection.delegate = self
        collection.register(MainViewCollectionCell.self, forCellWithReuseIdentifier: MainViewCollectionCell.identifier)
        collection.backgroundColor = .cyan
        return collection
    }()

    lazy var mainViewTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .clear
        table.register(MainViewTableCell.self, forCellReuseIdentifier: MainViewTableCell.identifier)
        return table
    }()
    lazy var tableLabel: UILabel = {
        let label = UILabel()
        label.text = "Ежедневный прогноз"
        label.textColor = textMain
        return label
    }()


    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = viewColor
        view.layer.cornerRadius = 5
        return view
    }()
    // MARK: main subviews
    lazy var minDegreeLabel: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = whiteColor
        return label
    }()
    lazy var maxDegreeLabel: UILabel = {
        let label = UILabel()
        label.text = "13"
        label.textColor = whiteColor
        return label
    }()
    lazy var identDegre: UILabel = {
        let label = UILabel()
        label.text = "/"
        label.textColor = whiteColor
        return label
    }()

    lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "13"
        label.font = UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.bold)
        return label
    }()
    lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Возможен небольшой дождь"
        return label
    }()

    lazy var reinLabel: UILabel = {
        let label = UILabel()
       // label.text = "Ежедневный прогноз"
        return label
    }()

    lazy var windLabel: UILabel = {
        let label = UILabel()
       // label.text = "Ежедневный прогноз"
        return label
    }()

    lazy var humLabel: UILabel = {
        let label = UILabel()
       // label.text = "Ежедневный прогноз"
        return label
    }()


    lazy var onDayHourView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    lazy var onDayHourLabel: UILabel = {
        let label = UILabel()
        label.text = "Подробнее на 24 часа"
        label.textColor = textMain
        return label
    }()

    init(mainPresenter: IMainPresenter) {
        self.mainPresenter = mainPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainPresenter.start()
        layout()
        setupConstraints()
    }
    private func layout(){
        view.backgroundColor = .white
        setupSubView()
        view.addSubviews([mainView, onDayHourLabel, onDayHourView, mainViewCollection, tableLabel, mainViewTable])
    }
    private func setupSubView(){
        mainView.addSubviews([identDegre, minDegreeLabel, maxDegreeLabel, degreeLabel, weatherLabel])

    }

    func setTitle(title: String){
        self.title = title
        print(title)
    }

    func setWeather(weather : [String]){
        print(weather[0])
        degreeLabel.text = weather[0]
    }

    private func setupConstraints(){
        let leftIdent: CGFloat = 12
        let topIdent: CGFloat = leftIdent * 2
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            //MARK: mainViewConstraints
            identDegre.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            identDegre.topAnchor.constraint(equalTo: mainView.topAnchor, constant: leftIdent * 3),

            minDegreeLabel.trailingAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -leftIdent),
            minDegreeLabel.topAnchor.constraint(equalTo: identDegre.topAnchor),

            maxDegreeLabel.leadingAnchor.constraint(equalTo: mainView.centerXAnchor, constant: leftIdent),
            maxDegreeLabel.topAnchor.constraint(equalTo: identDegre.topAnchor),

            degreeLabel.topAnchor.constraint(equalTo: identDegre.bottomAnchor, constant: leftIdent / 2),
            degreeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),

            weatherLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: leftIdent / 2),
            weatherLabel.centerXAnchor.constraint(equalTo: degreeLabel.centerXAnchor),

            mainView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leftIdent),
            mainView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -leftIdent),
            mainView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: leftIdent),
            mainView.heightAnchor.constraint(equalToConstant: 212),
            //MARK: close mainViewConstraints

            onDayHourLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -leftIdent),
            onDayHourLabel.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: topIdent),

            onDayHourView.leadingAnchor.constraint(equalTo: onDayHourLabel.leadingAnchor),
            onDayHourView.trailingAnchor.constraint(equalTo: onDayHourLabel.trailingAnchor),
            onDayHourView.topAnchor.constraint(equalTo: onDayHourLabel.topAnchor),
            onDayHourView.bottomAnchor.constraint(equalTo: onDayHourLabel.bottomAnchor),

            mainViewCollection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leftIdent),
            mainViewCollection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            mainViewCollection.topAnchor.constraint(equalTo: onDayHourView.bottomAnchor, constant: topIdent),
            mainViewCollection.heightAnchor.constraint(equalToConstant: 85),

            tableLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            tableLabel.topAnchor.constraint(equalTo: mainViewCollection.bottomAnchor, constant: topIdent),

            mainViewTable.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            mainViewTable.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            mainViewTable.topAnchor.constraint(equalTo: tableLabel.bottomAnchor, constant: topIdent),
            mainViewTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),


            ])
    }
}

