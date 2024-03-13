
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var segmentControll: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()

        //locationManager.delegate = self
        //locationManager.startUpdatingLocation()

        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true

        mapView.delegate = self

        addGorodets()

        //setPin()
        //locationManager.authorizationStatus
    }


    @IBAction func segmentControllAction(_ sender: Any) {
        switch segmentControll.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            locationManager.startUpdatingLocation()
        case 1:
            mapView.mapType = .satellite
            locationManager.stopUpdatingLocation()
        case 2:
            mapView.mapType = .hybrid
        default:
            break
        }
    }

    @IBAction func pushGorodetsAction(_ sender: Any) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56.644822, longitude: 43.472360), latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }

    func setPin(title: String, coordinate: CLLocationCoordinate2D) {
        let annoation = MKPointAnnotation()
        annoation.title = title
        annoation.coordinate = coordinate

        mapView.addAnnotation(annoation)
    }

    var annotation = MyAnnotation()
    func addGorodets() {
        annotation.object = "Gorodets description"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 56.644822, longitude: 43.472360)
        annotation.title = "Gorodets"
        mapView.addAnnotation(annotation)
    }
