//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by redinfo on 2020/10/22.
//  Copyright © 2020 redinfo. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var weatherInfoLabel: UILabel!
    
    @IBOutlet weak var tepLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var bottomContainer: UIView!
    
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    @IBOutlet weak var infoCollectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        mainInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func mainInit() {
        //載入nib文件
        Bundle.main.loadNibNamed("WeatherView", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.bounds
        //寬高自動調整大小
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupTableView()
        setupHourlyCollectionView()
        setupInfoCollectionView()
    }
    
    private func setupTableView() {
        
    }
    
    private func setupHourlyCollectionView() {
        
    }
    
    private func setupInfoCollectionView() {
        
    }
}
