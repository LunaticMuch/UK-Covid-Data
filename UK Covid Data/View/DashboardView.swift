//
//  ContentView.swift
//  UK Covid Data
//
//  Created by Stefano Cislaghi on 09/01/2022.
//

import SwiftUI
import SwiftUICharts

struct DashboardView: View {

    @ObservedObject var covidData = CovidData()

    let blueStyle = ChartStyle(backgroundColor: .white,
                              foregroundColor: [ColorGradient(.purple, .blue)])

    var body: some View {
        ScrollView {
                VStack {
                    HStack {
                        Text("UK Dashboard")
                            .font(.system(size: 28, weight: .bold))
                        Spacer()
                        Button(action: {covidData.loadData()}) {
                            Image(systemName: "arrow.counterclockwise.circle.fill")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 28, weight: .bold))
                                // .background(Color("background3"))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)

                        }
                    }
                    .padding()
                    VStack(spacing: 20) {
                        VStack {
                            CardView {
                                HStack {
                                    Text("Cases")
                                        .font(.system(size: 24, weight: .bold))
                                        .padding()
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        let lastCases: String = covidData.lastSnapshot?.cases.formattedWithSeparator ?? ""
                                        Text("\(lastCases)")
                                            .font(.system(size: 18, weight: .semibold))
                                        Text("on \(covidData.lastSnapshot?.date.toString(format: "dd-MM-YYYY") ?? "")")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(UIColor.secondaryLabel))
                                    }.padding()
                                }
                                ChartLabelName(" ", type: .legend)
                                BarChart()
                                ChartLabel("Last 60 days", type: .legend, format: "%.0f")
                            }
                            .data(covidData.last60Snapshots.map({($0.date.toString(format: "dd-MM-YYYY"), Double($0.cases))}))
                            .chartStyle(blueStyle)
                            .frame(height: 240)
                            .padding()
                        }

                        VStack {
                            CardView {
                                HStack {
                                    Text("Deaths")
                                        .font(.system(size: 24, weight: .bold))
                                        .padding()
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        let lastDeaths = covidData.lastSnapshot?.deaths.formattedWithSeparator ?? ""
                                        Text("\(lastDeaths)")
                                            .font(.system(size: 18, weight: .semibold))
                                        Text("on \(covidData.lastSnapshot?.date.toString(format: "dd-MM-YYYY") ?? "")")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(UIColor.secondaryLabel))
                                    }.padding()
                                }

                                ChartLabelName(" ", type: .legend)
                                BarChart()
                                ChartLabel("Last 60 days", type: .legend, format: "%.0f")
                            }
                            .data(covidData.last60Snapshots.map({($0.date.toString(format: "dd-MM-YYYY"), Double($0.deaths))}))
                            .chartStyle(blueStyle)
                            .frame(height: 240)
                            .padding()
                        }

                    }
                    Spacer()
                }
                .onAppear(perform: {covidData.loadData()})
        }

            }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
       // ContentView().preferredColorScheme(.dark)
    }
}
