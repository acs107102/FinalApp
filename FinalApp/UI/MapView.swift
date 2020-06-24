//
//  MapView.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/10.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(control: self)
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        
          var mapViewController: MapView
            
          internal init(control: MapView) {
              self.mapViewController = control
          }
            
        private func mapView(_ mapView: MKMapView, viewFor
               annotation: MKPointAnnotation) -> MKAnnotationView?{
             // Custom View for Annotation
              let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin") ?? MKAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
              annotationView.canShowCallout = true
              // 可改成 custom image icon: "MKPinAnnotationView"
              annotationView.image = UIImage(named: "Pin")
              return annotationView
           }
    }
        
    func makeUIView(context: Context) -> MKMapView {
        let annotations = MKPointAnnotation()
        annotations.coordinate = coordinate
        annotations.title = name
        annotations.subtitle = "Here"
        let mapView = MKMapView()
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)  // 中心點範圍1000公尺
        mapView.setRegion(region, animated: true)
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotations)
        mapView.delegate = context.coordinator
        return mapView
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    typealias UIViewType = MKMapView
    
    
}

extension MKMapView {
    func fitMapViewToAnnotaionList() -> Void {
        let mapEdgePadding = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        var zoomRect:MKMapRect = MKMapRect.null

        for index in 0..<self.annotations.count {
            let annotation = self.annotations[index]
            let aPoint:MKMapPoint = MKMapPoint(annotation.coordinate)
            let rect:MKMapRect = MKMapRect(x: aPoint.x, y: aPoint.y, width: 0.1, height: 0.1)

            if zoomRect.isNull {
                zoomRect = rect
            } else {
                zoomRect = zoomRect.union(rect)
            }
        }
        self.setVisibleMapRect(zoomRect, edgePadding: mapEdgePadding, animated: true)
    }
}
