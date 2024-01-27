//
//  ContentView.swift
//  Animation404App
//
//  Created by Pouya Sadri on 26/01/2024.
//

import SwiftUI
//MARK: - Content View
struct ContentView: View {
	@State var isOuterLayerRotating = false
	@State var isInnerLayerRotating = false
    var body: some View {
		ZStack{
			
			Color.customBackground
				.ignoresSafeArea()
				.scaleEffect(1.2)
			
			VStack{
				TitleImageView()
				
				Spacer()
					.frame(height: 100)
				
				RotatingLayersView(isOuterLayerRotating: $isOuterLayerRotating, isInnerLayerRotating: $isInnerLayerRotating)
				
				Spacer()
					.frame(height: 200)
				
				HomePageNavigationButton()
			}
		}
    }
}

#Preview {
    ContentView()
}

//MARK: - Title image view
struct TitleImageView : View {
	var body: some View {
		Image("titlename")
			.resizable()
			.frame(width: 400,height: 40,alignment: .center)
	}
}

//MARK: - Rotating Layers View
struct RotatingLayersView: View {
	@Binding var isOuterLayerRotating : Bool
	@Binding var isInnerLayerRotating : Bool
	var body: some View {
		HStack{
			ZStack{
				OuterLayerView(isRotating: $isOuterLayerRotating)
				StaticLayerView()
				InnerLayerView(isRotating: $isInnerLayerRotating)
			}
		}
	}
}

//MARK: - Outer Layer View
struct OuterLayerView : View {
	@Binding var isRotating : Bool
	var body: some View {
		Image("layerEarth")
			.resizable()
			.frame(width: 260,height: 260)
			.rotationEffect(.degrees(isRotating ? -180 : 0))
			.animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: isRotating)
			.onAppear{
				self.isRotating.toggle()
			}
	}
}

//MARK: - Static Layer view
struct StaticLayerView : View {
	var body: some View {
		HStack{
			FourLayerView()
			
			Spacer()
				.frame(width: 100,height: 100,alignment: .center)
			
			FourLayerView()
		}
	}
}

//MARK: - Four Layer View
struct FourLayerView : View {
	var body: some View {
		Image("layer4")
			.resizable()
			.frame(width: 100,height: 130,alignment: .center)
			.shadow(radius: 10,x:0, y:0)
	}
}

//MARK: - Inner Layer View
struct InnerLayerView : View {
	@Binding var isRotating : Bool
	var body: some View {
		Image("layerrocket")
			.resizable()
			.frame(width: 300,height: 300)
			.rotationEffect(.degrees(isRotating ? 360 : 0))
			.animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: false), value: isRotating)
			.onAppear{
				self.isRotating.toggle()
			}
	}
}

//MARK: - Home Page Navigation Button
struct HomePageNavigationButton : View {
	var body: some View {
		ZStack{
			RoundedRectangle(cornerRadius: 25)
				.frame(width: 200,height: 60,alignment: .center)
				.foregroundColor(.customBackground)
				.overlay(
					RoundedRectangle(cornerRadius: 25)
						.stroke(Color.white,lineWidth: 1)
				)
			
			HStack{
				Text("GO TO")
					.font(.headline)
					.fontWeight(.medium)
					.foregroundStyle(.white)
				
				Image("home")
					.resizable()
					.scaledToFit()
					.frame(width: 50,height: 50,alignment: .center)
				
				Text("PAGE")
					.font(.headline)
					.fontWeight(.medium)
					.foregroundStyle(.white)
			}
		}
	}
}

//MARK: - Color Extention
extension Color{
	static let customBackground = Color(red: 0.08, green: 0.2, blue: 0.29)
}
