//
//  Drawing1.swift
//  BacarakaV1
//
//  Created by Indra Kurniawan on 08/11/20.
//

import Foundation
import SwiftUI

struct Drawing1: View {
    
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var color: Color = Color.white
    @State private var lineWidth: CGFloat = 30.0
    
    let point1: CGPoint = CGPoint(x: 500, y: 200)
    let point2: CGPoint = CGPoint(x: 500, y: 50)
    let point3: CGPoint = CGPoint(x: 450, y: 520)
    
    let location1: CGPoint = CGPoint(x: 500, y: 500)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Path{ path in
                    path.move(to: point1)
                    path.addLine(to: point2)
                }
                .stroke(style: StrokeStyle( lineWidth: 5, dash: [10]))
                .foregroundColor(Color(UIColor.gray))
                num1Line()
                
                Path { path in
                    for drawing in self.drawings {
                        self.add(drawing: drawing, toPath: &path)
                    }
                    self.add(drawing: self.currentDrawing, toPath: &path)
                }
                .stroke(self.color, style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round))
                    .background(Color.blue.opacity(0.001))
                    .gesture(
                        DragGesture(minimumDistance: 0.1)
                            .onChanged({ (value) in
                                let currentPoint = value.location
                                if currentPoint.y >= 0
                                    && currentPoint.y < geometry.size.height {
                                    self.currentDrawing.points.append(currentPoint)
                                }
                                if (currentPoint.x >= location1.x-30 && currentPoint.x <= location1.x+30 && currentPoint.y >= location1.y-30 && currentPoint.y <= location1.y+30) {
                                    print("yo")
                                }
//                                print(value.location.x)
                            })
                            .onEnded({ (value) in
                                self.drawings.append(self.currentDrawing)
                                self.currentDrawing = Drawing()
                                print("Value = \(value)")
                                        })
                )
                Text("hello")
                    .foregroundColor(.blue)
                    .position(location1)
            }
        }
    }
    
    private func add(drawing: Drawing, toPath path: inout Path) {
        let points = drawing.points
            if points.count > 1 {
                for i in 0..<points.count-1 {
                    let current = points[i]
                    let next = points[i+1]
                    path.move(to: current)
                    path.addLine(to: next)
                }
            }
    }
    
    
}

struct num1Line: View {
    var body: some View {
        
        
       
        Path{ path in
            path.move(to: CGPoint(x: 500, y: 50))
            path.addLine(to: CGPoint(x: 700, y: 50))
        }
        .stroke(style: StrokeStyle( lineWidth: 5, dash: [10]))
        .foregroundColor(Color(UIColor.gray))

        Path{ path in
            path.move(to: CGPoint(x: 700, y: 50))
            path.addLine(to: CGPoint(x: 700, y: 200))
        }
        .stroke(style: StrokeStyle( lineWidth: 5, dash: [10]))
        .foregroundColor(Color(UIColor.gray))
        
    }
}
