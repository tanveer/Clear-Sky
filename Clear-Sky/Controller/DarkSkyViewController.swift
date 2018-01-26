//
//  ViewController.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit
import CoreLocation


class DarkSkyViewController: UIViewController {
    private var locationManager: CLLocationManager!
    private lazy var geocoder: CLGeocoder = {return CLGeocoder()}()
    private var weather: Weather? {
        didSet{
            currently = weather?.currently
            hourly = weather?.hourly
        }
    }
    private var hourly: Hourly?
    private var currently: Currently? {
        didSet{
            updateUI(with: currently)
        }
    }
    lazy var darkApiClient: DarkSkyAPIClient = {
        return DarkSkyAPIClient()
    }()

    @IBOutlet private weak var tempratureLowLabel: UILabel!
    @IBOutlet private weak var tempratureHighLabel: UILabel!
    @IBOutlet private weak var todayLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var tableView:UITableView! {
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(DailyCell.nib, forCellReuseIdentifier: DailyCell.id)
            tableView.backgroundView = UIImageView(image: UIImage(named: "night-sky.jpg"))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        requestLocationAccess()
    }

    private func  requestLocationAccess() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
        if !isSimulator {
             requesWeatherData(at: Coordinate(coordinate: (locationManager.location?.coordinate)!))
        }
    }

    private func reverseGeocoding(from location: CLLocation){
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let placemark = placemarks?.last {
                self.cityLabel.text = placemark.locality ?? "n/a"
                self.title = placemark.locality ?? "Clear Sky"
            }
        }
    }

    private func updateUI(with currently: Currently?){
        if let currently = currently {
            self.summaryLabel.text = currently.summary
            self.tempLabel.text = "\(currently.temperature.round)º"
            self.dayLabel.text = now.dateFromUnixTime(currently.time.unixTime).day
            self.tempratureHighLabel.text = currently.temperature.round
            self.tempratureLowLabel.text = currently.apparentTemperature.round
        }
    }

    private func requesWeatherData(at coordinate: Coordinate) {
        darkApiClient.getCurrentWeather(at: coordinate) { [unowned self] (weather, error) in
            guard let weather = weather else { return }
            self.weather = weather
            self.tableView.tableFooterView = SectionFooterView.getFooterView(for: weather)
            self.tableView.reloadData()
        }
    }
}

extension DarkSkyViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { print("unable to find location"); return }
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        reverseGeocoding(from: location)
        requesWeatherData(at: Coordinate(coordinate: location.coordinate))
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension DarkSkyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather?.daily.data.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyCell.id, for: indexPath) as! DailyCell
        let dailyData = weather?.daily.data ?? []
        cell.dailyData = dailyData[indexPath.row]
        return cell
    }
}

extension DarkSkyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeader()
        return headerView.sectionHeaderView(hourly: hourly?.data ?? [])
    }
}
