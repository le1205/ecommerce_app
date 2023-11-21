//
//  Progressbar.swift
//  RealityFence
//
//  Created by Secret on 7/12/23.
//

import SwiftUI

struct Progressbar: View {
    
    var type : any Numeric
    var totalTime: CGFloat
    @State private var progress: CGFloat = 0.0
//    private let totalTime: CGFloat = 5.0
    
    
    var body: some View {
        VStack {
            if progress < 1.0 {
                ProgressView(value: progress)
                    .padding()
                    .onAppear {
                        simulateProgress()
                    }
                Text("\(Int(progress * 100))%") // Display progress value
                    .font(.headline)
                    .padding(.top, 8)
                    .foregroundColor(.black)
            }
             else {
                 if type as! Int == 1 {
                     Image("ic_success") // Success image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 40, height: 40)
                         .foregroundColor(.green)
                         .padding(.bottom, 16)
                 }
                 else {
                     
                 }
            }
        }
        .padding()
    }

    func simulateProgress() {
        let interval: TimeInterval = 0.001
        let steps = Int(totalTime / CGFloat(interval))
        let increment = 1.0 / CGFloat(steps)
        
        for step in 0..<steps {
            DispatchQueue.main.asyncAfter(deadline: .now() + interval * TimeInterval(step)) {
                progress += increment
            }
        }
    }
}
struct Progressbar_Previews: PreviewProvider {
    static var previews: some View {
        Progressbar(type: 1, totalTime: 5.0)
    }
}

