@XRG.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.MapMarker extends Entities.Model
    defaults: 
      title: ''      
      markercontent: ''
      lat: 0
      lng: 0

  class Entities.MapMarkers extends Entities.Collection
    model: Entities.MapMarker
    chooseByName: (name) ->
      @choose (@findWhere(title: name))

    @include "SingleChooser"

  class Entities.BusRoute extends Entities.Model
    initialize: ->
      @initStops()

    initStops: ->
      stops = @get 'stops'
      if stops
        markerCollection = new Entities.MapMarkers stops        
        @set 'stops', markerCollection

  class Entities.BusRoutesCollection extends Entities.Collection
    model: Entities.BusRoute
    comparator: 'name'

    chooseByName: (name) ->
      @choose (@findWhere(name: name))

    @include "SingleChooser"

  API =
    getBusRoutes: ->
      new Entities.BusRoutesCollection [
        { name: "V1", description: "Encounter Bay to Victor Harbor Campus", stops: @getV1Stops() }
        { name: "V2", description: "Victor Harbor/Pt Elliot to Victor Harbor Campus", stops: @getV2Stops() }
        { name: "V3", description: "Cape Jervis/Normanville to Victor Harbor Campus", stops: @getV3Stops() }
        { name: "V4", description: "Hindmarsh Tiers/Mt Compass to Victor Harbor Campus", stops: @getV4Stops() }
        { name: "G1", description: "Goolwa Beach/Hindmarsh Is to Goolwa Campus", stops: @getG1Stops() }
        { name: "G2", description: "Clayton/Milang/Finniss/Nth Goolwa to Goolwa Campus", stops: @getG2Stops() }
        { name: "G3", description: "Nangkita/Mt Compass/Middleton to Goolwa Campus", stops: @getG3Stops() }
        { name: "G4", description: "Ashbourne/Strathalbyn to Goolwa Campus", stops: @getG4Stops() }
      ]
    
    getV1Stops: ->
      return [
        { name: "Stop 1 (A)",    description: "Franklin Parade Boat Ramp",                                am_time: "8:10", pm_time: "4:01", markercontent: "", lat: -35.585546,  lng: 138.597684 }
        { name: "Stop 2 (B)",    description: "Cnr Battye Rd & Joy Street",                               am_time: "8:13", pm_time: "4:05", markercontent: "", lat: -35.5806810,  lng: 138.5916790 }
        { name: "Stop 3 (C)",    description: "Cnr Waitpinga Rd & Tugwell Rd",                            am_time: "8:16", pm_time: "4:07", markercontent: "", lat: -35.569284,  lng: 138.589076 }
        { name: "Stop 4 (D)",    description: "Cnr Whalers Rd & Mollien Ave",                             am_time: "8:19", pm_time: "4:09", markercontent: "", lat: -35.5750260,  lng: 138.5944410 }
        { name: "Stop 5 (E) AM", description: "Cnr Franklin Pde & Tabernacle Rd. This stop is AM only.",  am_time: "8:22", pm_time: "N/A",  markercontent: "", lat: -35.573928,   lng: 138.603295 }
        { name: "Stop 5 (E) PM", description: "Yilki General Store. This stop is PM only.",               am_time: "N/A",  pm_time: "3:58", markercontent: "", lat: -35.574797,   lng: 138.602366 }
        { name: "Stop 6 (F)",    description: "Encounter Conference Centre",                              am_time: "8:25", pm_time: "3:55", markercontent: "", lat: -35.5658940,  lng: 138.6069820 }
        { name: "Stop 7 (G)",    description: "Victor Harbor Campus",                                     am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.5546510,  lng: 138.5978210 }
      ]

    getV2Stops: ->
      return [
        { name: "Stop 1 (A)",   description: "Cnr George Main Rd & Jolly St",                           am_time: "7:45", pm_time: "3:53", markercontent: "", lat: -35.556861, lng: 138.603149 }
        { name: "Stop 2 (B)",   description: "Victoria St (opp Bailey Homes)",                          am_time: "7:48", pm_time: "3:56", markercontent: "", lat: -35.556936, lng: 138.61765 }
        { name: "Stop 3 (C)",   description: "Torrens St (Apollon Motor Inn)",                          am_time: "7:50", pm_time: "3:58", markercontent: "", lat: -35.552397, lng: 138.62243 }
        { name: "Stop 4 (D)",   description: "Bus Stop 2, Hindmarsh Rd (Cnr Pine Ave)",                 am_time: "7:52", pm_time: "4:00", markercontent: "", lat: -35.54679, lng: 138.626207 }
        { name: "Stop 5 (E)",   description: "Bus Stop 3, Hindmarsh Rd (Cnr Wattle Drive)",             am_time: "7:53", pm_time: "4:01", markercontent: "", lat: -35.542825, lng: 138.630063 }
        { name: "Stop 6 (F)",   description: "Bus Stop 6, Port Elliot Rd (Emerald Chinese)",            am_time: "7:57", pm_time: "4:05", markercontent: "", lat: -35.536337, lng: 138.640609 }
        { name: "Stop 7 (G)",   description: "Bus Stop 8, Port Elliot Rd (Cnr Ocean Rd)",               am_time: "7:58", pm_time: "4:06", markercontent: "", lat: -35.534653, lng: 138.651676 }
        { name: "Stop 8 (H)",   description: "Cnr Pt Elliot Rd & St Lukes St",                          am_time: "8:00", pm_time: "4:08", markercontent: "", lat: -35.531826, lng: 138.670561 }
        { name: "Stop 9 (I)",   description: "Cnr Pt Elliot Rd & Tottenham Crt Rd (Fish & Chip Shop)",  am_time: "8:01", pm_time: "4:09", markercontent: "", lat: -35.530846, lng: 138.677182 }
        { name: "Stop 10 (J)",  description: "Bus Stop 10, Pt Elliot Rd (Uniting Church)",              am_time: "8:02", pm_time: "4:10", markercontent: "", lat: -35.530436, lng: 138.679732 }
        { name: "Stop 11 (K)",  description: "Bus Stop 11, Pt Elliot Rd (Cnr Frenchman Drive)",         am_time: "8:03", pm_time: "4:11", markercontent: "", lat: -35.529904, lng: 138.683401 }
        { name: "Stop 12 (L)",  description: "Waterport Rd Bus stop (opp Vanali Dr)",                   am_time: "8:05", pm_time: "4:13", markercontent: "", lat: -35.518942, lng: 138.685744 }
        { name: "Stop 13 (M)",  description: "Cnr Waterport Rd & Tottenham Crt Rd",                     am_time: "8:08", pm_time: "4:16", markercontent: "", lat: -35.520478, lng: 138.67462 }
        { name: "Stop 14 (N)",  description: "Cnr Waterport Rd & Ocean Rd",                             am_time: "8:10", pm_time: "4:18", markercontent: "", lat: -35.524403, lng: 138.649145 }
        { name: "Stop 16 (P)",  description: "Lipizzaner Drive (Race course driveway)",                 am_time: "8:17", pm_time: "4:25", markercontent: "", lat: -35.515013, lng: 138.620984 }
        { name: "Stop 17 (Q)",  description: "Arabian Court (opp. Lipizzaner Dr)",                      am_time: "8:18", pm_time: "4:26", markercontent: "", lat: -35.512821, lng: 138.619863 }
        { name: "Stop 18 (R)",  description: "Cnr Waggon Rd & Day Rd",                                  am_time: "8:19", pm_time: "4:28", markercontent: "", lat: -35.537587, lng: 138.616367 }
        { name: "Stop 19 (S)",  description: "Cnr Canterbury Rd & Galpin Ave",                          am_time: "8:20", pm_time: "4:29", markercontent: "", lat: -35.542175, lng: 138.615209 }
        { name: "Stop 20 (T)",  description: "Cnr Canterbury Rd & Keithalan Rd",                        am_time: "8:22", pm_time: "4:31", markercontent: "", lat: -35.546945, lng: 138.612494 }
        { name: "Stop 21 (U)",  description: "Victor Harbor Campus",                                    am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.5546510, lng: 138.5978210 }
      ]

    getV3Stops: ->
      return [
        { name: "Stop 1 (A)",   description: "Cnr Range Rd & Fraser Rd",                          am_time: "6:44", pm_time: "5:36", markercontent: "", lat: -35.569455,   lng: 138.467103 }
        { name: "Stop 2 (B)",   description: "Cnr Range Rd & Maylands Rd",                        am_time: "6:53", pm_time: "5:27", markercontent: "", lat: -35.558247,   lng: 138.386723 }
        { name: "Stop 3 (C)",   description: "Cnr Main South Rd & James St, Cape Jervis",         am_time: "7:16", pm_time: "5:04", markercontent: "", lat: -35.604216,  lng: 138.112928 }
        { name: "Stop 4 (D)",   description: "Cnr Main South Rd & Cole Rd, Delamere",             am_time: "7:24", pm_time: "4:56", markercontent: "", lat: -35.5700310,  lng: 138.1973860 }
        { name: "Stop 5 (E)",   description: "Cnr Main South Rd & St Andrews Blvd",               am_time: "7:39", pm_time: "4:41", markercontent: "", lat: -35.457882,  lng: 138.309093 }
        { name: "Stop 6 (F)",   description: "Bus Stop opp. Normanville Post Office",             am_time: "7:42", pm_time: "4:38", markercontent: "", lat: -35.446864,  lng: 138.318514 }
        { name: "Stop 7 (G)",   description: "Yankalilla Area School",                            am_time: "7:45", pm_time: "4:35", markercontent: "", lat: -35.453801,  lng: 138.332717 }
        { name: "Stop 8 (H)",   description: "CFS Shed, Main Rd, Yankalilla",                     am_time: "7:50", pm_time: "4:30", markercontent: "", lat: -35.458924,  lng: 138.351645 }
        { name: "Stop 9 (I)",   description: "Cnr Inman Valley Rd & Torrens Vale Rd",             am_time: "7:58", pm_time: "4:22", markercontent: "", lat: -35.492158,  lng: 138.382876 }
        { name: "Stop 10 (J)",  description: "Cnr Yankalilla-Victor Harbor Rd & Bald Hills Rd",   am_time: "8:02", pm_time: "4:18", markercontent: "", lat: -35.501531,   lng: 138.410621 }
        { name: "Stop 11 (K)",  description: "Cnr Inman Valley Rd & Mt Alma Rd",                  am_time: "8:14", pm_time: "4:06", markercontent: "", lat: -35.497461,   lng: 138.513039 }
        { name: "Stop 12 (L)",  description: "Victor Harbor Campus",                              am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.5546510,  lng: 138.5978210 }
      ]

    getV4Stops: ->
      return [
        { name: "Stop 1 (A)",     description: "Cnr Nettle Rd & Hindmarsh Tiers Rd",                                                am_time: "7:35", pm_time: "4:24", markercontent: "", lat: -35.43875, lng: 138.595527 }
        { name: "Stop 2 (B)",     description: "No. 1354 Hindmarsh Tiers Rd (Country Gates)",                                       am_time: "7:39", pm_time: "4:28", markercontent: "", lat: -35.391184, lng: 138.503391 }
        { name: "Stop 3 (C)",     description: "Cnr Hindmarsh Tiers Rd & Blockers Rd (Electricity Depot)",                          am_time: "7:45", pm_time: "4:44", markercontent: "", lat: -35.378407, lng: 138.48516 }
        { name: "Stop 4 (D)",     description: "Victor Harbor Rd & Pages Flat Rd (Moo View)",                                       am_time: "7:58", pm_time: "4:57", markercontent: "", lat: -35.313742, lng: 138.580982 }
        { name: "Stop 5 (E)",     description: "Victor Harbor Rd & Jacobs Rd",                                                      am_time: "8:01", pm_time: "5:00", markercontent: "", lat: -35.331928, lng: 138.589841 }
        { name: "Stop 6 (F)",     description: "Mt Compass pedestrian lights",                                                      am_time: "8:04", pm_time: "5:03", markercontent: "", lat: -35.349483, lng: 138.621431 }
        { name: "Stop 7 (G)",     description: "Cnr Victor Harbor Rd & Goolwa Rd",                                                  am_time: "8:07", pm_time: "5:06", markercontent: "", lat: -35.378483, lng: 138.629242 }
        { name: "Stop 8 (H)",     description: "Victor Harbor Rd - Mt Jagged Winery",                                               am_time: "8:10", pm_time: "5:09", markercontent: "", lat: -35.417384, lng: 138.633078 }
        { name: "Stop 9 (I)",     description: "Cnr Victor Harbor Rd & Mosquito Hill Road (300m south on gravel)",                   am_time: "8:14", pm_time: "5:17", markercontent: "", lat: -35.45062, lng: 138.643254 }
        { name: "Stop 10 (J) AM", description: "Cnr Victor Harbor Rd & Hindmarsh Tiers Rd (bus shelter). This stop is AM only.",    am_time: "8:20", pm_time: "N/A", markercontent: "", lat: -35.499059, lng: 138.628776 }
        { name: "Stop 10 (J) PM", description: "Cnr Hindmarsh Tiers Rd & Hutchinson Rd. This stop is PM only.",                     am_time: "N/A",  pm_time: "3:59", markercontent: "", lat: -35.489682, lng: 138.619539 }
        { name: "Stop 11 (K)",    description: "Cnr Victor Harbor Rd & Ring Rd (Urimbirra car park)",                               am_time: "8:22", pm_time: "3:56", markercontent: "", lat: -35.519303, lng: 138.632589 }
        { name: "Stop 12 (L)",    description: "Victor Harbor Campus",                                                              am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.5546510, lng: 138.5978210 }
      ]

    getG1Stops: ->
      return [
        { name: "Stop 1 (A)",   description: "Beach Road (Woolworths)",                         am_time: "7:45", pm_time: "4:22", markercontent: "", lat: -35.505352,  lng: 138.776539 }
        { name: "Stop 2 (B)",   description: "Cnr Beach Rd & Castle Ave (on Castle Ave)",       am_time: "7:48", pm_time: "4:25", markercontent: "", lat: -35.517325,  lng: 138.774436 }
        { name: "Stop 3 (C)",   description: "Cnr Castle Ave & Bradford Rd (on Castle Ave)",    am_time: "7:51", pm_time: "4:28", markercontent: "", lat: -35.515448,  lng: 138.765037 }
        { name: "Stop 4 (D)",   description: "Bradford Rd (just before Cave St)",               am_time: "7:53", pm_time: "4:30", markercontent: "", lat: -35.513169,  lng: 138.766974 }
        { name: "Stop 5 (E)",   description: "Cnr Cave St & Golfview Rd (on Golfview Rd)",      am_time: "7:56", pm_time: "4:32", markercontent: "", lat: -35.509909,  lng: 138.761425 }
        { name: "Stop 6 (F)",   description: "Bus Stop 14, Pt Elliot Rd",                       am_time: "7:58", pm_time: "4:15", markercontent: "", lat: -35.505239,  lng: 138.77 }
        { name: "Stop 7 (G)",   description: "Cnr Excelsior Pde & Wentworth Pde",               am_time: "8:12", pm_time: "4:03", markercontent: "", lat: -35.518080,  lng: 138.817663 }
        { name: "Stop 8 (H)",   description: "Cnr Excelsior Pde & Britannia Pde",               am_time: "8:15", pm_time: "4:06", markercontent: "", lat: -35.516108,  lng: 138.819459 }
        { name: "Stop 9 (I)",   description: "Cnr Princess Royal Pde & Providence Pl",          am_time: "8:19", pm_time: "4;10", markercontent: "", lat: -35.512154,  lng: 138.811139 }
        { name: "Stop 10 (J)",  description: "Hindmarsh Island Information Bay, Randell Road",  am_time: "8:24", pm_time: "4:15", markercontent: "", lat: -35.507902,  lng: 138.793115 }
        { name: "Stop 11 (K)",  description: "Goolwa Campus",                                   am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.4964640, lng: 138.7785770 }
      ]

    getG2Stops: ->
      return [
        { name: "Stop 1 (A)",   description: "Cnr Daranda Tce & Ameroo Ave, Milang",                    am_time: "7:10", pm_time: "5:10", markercontent: "", lat: -35.409067, lng: 138.971135 }
        { name: "Stop 2 (B)",   description: "Cnr Alexandrina Dr & Islandview Dr, Clayton",             am_time: "7:28", pm_time: "4:52", markercontent: "", lat: -35.490691, lng: 138.922588 }
        { name: "Stop 3 (C)",   description: "662 Finniss-Clayton Rd",                                  am_time: "7:36", pm_time: "4:44", markercontent: "", lat: -35.442133, lng: 138.885479 }
        { name: "Stop 4 (D)",   description: "Cnr of Glengrove Rd & Clayton-Finniss Rd",                am_time: "7:40", pm_time: "4:40", markercontent: "", lat: -35.43606, lng: 138.878589 }
        { name: "Stop 5 (E)",   description: "208 Finniss-Clayton Rd",                                  am_time: "7:45", pm_time: "4:35", markercontent: "", lat: -35.399292, lng: 138.848443 }
        { name: "Stop 6 (F)",   description: "Finniss General Store",                                   am_time: "7:53", pm_time: "4:27", markercontent: "", lat: -35.381834, lng: 138.823992 }
        { name: "Stop 7 (G)",   description: "Cnr Alexandrina Rd & Main Rd, Finniss",                   am_time: "7:55", pm_time: "4:25", markercontent: "", lat: -35.373291, lng: 138.817036 }
        { name: "Stop 8 (H)",   description: "Cnr Fenchurch St & Osborne St",                           am_time: "8:14", pm_time: "4:06", markercontent: "", lat: -35.495618, lng: 138.792021 }
        { name: "Stop 9 (I)",   description: "Cnr Fenchurch St & New Orleans St",                       am_time: "8:16", pm_time: "4:04", markercontent: "", lat: -35.492945, lng: 138.799295 }
        { name: "Stop 10 (J)",  description: "Cnr Liverpool Rd & Noble Ave",                            am_time: "8:20", pm_time: "4:00", markercontent: "", lat: -35.495113, lng: 138.813999 }
        { name: "Stop 11 (K)",  description: "Cnr Liverpool Rd & Currency Creek Rd",                    am_time: "8:22", pm_time: "3:58", markercontent: "", lat: -35.494624, lng: 138.803541 }
        { name: "Stop 12 (L)",  description: "Cnr Brooking St & Fenchurch St",                          am_time: "8:26", pm_time: "3:54", markercontent: "", lat: -35.500203, lng: 138.783673 }
        { name: "Stop 13 (M)",  description: "Goolwa Campus",                                           am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.4964640, lng: 138.7785770 }
      ]

    getG3Stops: ->
      return [
        { name: "Stop 1 (A)", description: "Nangkita Rd (near Stones Ford Rd)",             am_time: "7:35", pm_time: "4:45", markercontent: "", lat: -35.345423, lng: 138.675902 }
        { name: "Stop 2 (B)", description: "Mt Compass pedestrian lights",                  am_time: "7:41", pm_time: "4:39", markercontent: "", lat: -35.349483, lng: 138.621431 }
        { name: "Stop 3 (C)", description: "Cnr Goolwa Rd & Mt Compass Rd",                 am_time: "7:46", pm_time: "4:34", markercontent: "", lat: -35.378238, lng: 138.629605 }
        { name: "Stop 4 (D)", description: "Cnr Goolwa Rd & Mosquito Hill Rd",              am_time: "7:55", pm_time: "4:25", markercontent: "", lat: -35.417157, lng: 138.689965 }
        { name: "Stop 5 (E)", description: "Cnr Goolwa Rd & McHugh Rd",                     am_time: "7:58", pm_time: "4:22", markercontent: "", lat: -35.429335, lng: 138.705576 }
        { name: "Stop 6 (F)", description: "Cnr Goolwa Rd & Flagstaff Hill Rd",             am_time: "8:02", pm_time: "4:18", markercontent: "", lat: -35.44795, lng: 138.723077 }
        { name: "Stop 7 (G)", description: "Cnr Flagstaff Hill Rd & Victor Harbor/Goolwa Rd",             am_time: "8:10", pm_time: "4:10", markercontent: "", lat: -35.507085, lng: 138.709437 }
        { name: "Stop 8 (H)", description: "Cnr Rose St & Padman Cres",                     am_time: "8:14", pm_time: "4:06", markercontent: "", lat: -35.509066, lng: 138.713526 }
        { name: "Stop 9 (I)", description: "Cnr Chapman Rd & Morrison Ave",                am_time: "8:17", pm_time: "4:03", markercontent: "", lat: -35.510267, lng: 138.719851 }
        { name: "Stop 10 (J)", description: "Cnr Morrison Ave & Boettcher Rd",              am_time: "8:20", pm_time: "3:59", markercontent: "", lat: -35.511662, lng: 138.731044 }
        { name: "Stop 11 (K)", description: "Cnr Pt Elliot Rd & Boettcher Rd",              am_time: "8:21", pm_time: "3:58", markercontent: "", lat: -35.508697, lng: 138.735179 }
        { name: "Stop 12 (L)", description: "Bus Stop 14 (Cnr Gardiner St & Pt Elliot Rd)", am_time: "8:25", pm_time: "3:55", markercontent: "", lat: -35.505173, lng: 138.770324 }
        { name: "Stop 13 (M)", description: "Goolwa Campus",                                am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.4964640, lng: 138.7785770 }
      ]

    getG4Stops: ->
      return [
        { name: "Stop 1 (A)", description: "Greenman Inn, Ashbourne",                                am_time: "7:34", pm_time: "4:37", markercontent: "", lat: -35.287995,  lng: 138.765177 }
        { name: "Stop 2 (B)", description: "Cnr North Pde & West Tce, Strathalbyn (on North Pde)",   am_time: "7:50", pm_time: "4:32", markercontent: "", lat: -35.255217,  lng: 138.886284 }
        { name: "Stop 3 (C)", description: "Cnr North Pde (Tennis courts)",                          am_time: "7:53", pm_time: "4:29", markercontent: "", lat: -35.251967,  lng: 138.893529 }
        { name: "Stop 4 (D)", description: "Langhorne Creek Rd (near Callington Rd)",                am_time: "7:57", pm_time: "4:25", markercontent: "", lat: -35.2586930, lng: 138.8983980 }
        { name: "Stop 5 (E)", description: "Strathalbyn Train Station",                              am_time: "8:00", pm_time: "4:23", markercontent: "", lat: -35.2608140, lng: 138.8918320 }
        { name: "Stop 6 (F)", description: "Cnr Strathalbyn Rd & Braeside Rd",                       am_time: "8:13", pm_time: "4:08", markercontent: "", lat: -35.380627,  lng: 138.792388 }
        { name: "Stop 7 (G)", description: "Goolwa-Strathalbyn Rd (Gravel Pit)",                     am_time: "8:15", pm_time: "4:05", markercontent: "", lat: -35.39953,   lng: 138.763815 }
        { name: "Stop 8 (H)", description: "Canoe Tree, Strathalbyn Rd (near Winery Rd)",            am_time: "8:18", pm_time: "4:02", markercontent: "", lat: -35.434945,  lng: 138.777551 }
        { name: "Stop 9 (I)", description: "Cnr Alexandrina Rd & Narrows Rd",                        am_time: "8:22", pm_time: "3:56", markercontent: "", lat: -35.461544,  lng: 138.758922 }
        { name: "Stop 10 (J)", description: "Goolwa Campus",                                         am_time: "8:30", pm_time: "3:50", markercontent: "", lat: -35.4964640, lng: 138.7785770 }        
      ]

    
    getBusRoute: (id) ->
      allRoutes  = @getBusRoutes()
      return allRoutes.findWhere
        name: id

  App.reqres.setHandler "bus:route:entities", ->
    API.getBusRoutes()

  App.reqres.setHandler "bus:route:entity", (id) ->
    API.getBusRoute(id)