//
//  ViewController.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    var locationManager: CLLocationManager!

    private var hourly: Hourly?

    @IBOutlet private weak var tableView:UITableView! {
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
        API.fetchWeather { (hourly) in
            self.hourly = hourly
            self.tableView.reloadData()
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { print("unable to find location"); return }
        latitude = coordinate.latitude
        longitude = coordinate.longitude
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourly?.data.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(hourly?.data[indexPath.row].temperature ?? 0.0)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeader()
        return headerView.sectionHeaderView(hourly: hourly?.data ?? [])
    }
}
