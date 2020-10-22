//
//  WeatherViewController.swift
//  WeatherDemo
//
//  Created by redinfo on 2020/10/21.
//  Copyright © 2020 redinfo. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let weatherView = WeatherView()
        weatherView.frame = CGRect(x: 0, y: 0, width: weatherScrollView.bounds.width, height: weatherScrollView.bounds.height)
        weatherScrollView.addSubview(weatherView)
    }
    
}
