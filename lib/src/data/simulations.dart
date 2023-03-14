import 'package:flutter/material.dart';
import 'package:simulate/src/custom_items/chemistry_page.dart';
import 'package:simulate/src/custom_items/simulation_card.dart';
import 'package:simulate/src/data/themedata.dart';
import 'package:simulate/src/simulations/bubble_sort.dart';
import 'package:simulate/src/simulations/graph/graph_plotter_page.dart';
import 'package:simulate/src/simulations/optics/optics_page.dart';
import 'package:simulate/src/simulations/selection_sort.dart';
import 'package:simulate/src/simulations/epicycloid.dart';
import 'package:simulate/src/simulations/fourier_series.dart';
import 'package:simulate/src/simulations/rose_pattern.dart';
import 'package:simulate/src/simulations/toothpick.dart';
import 'package:simulate/src/simulations/insertion_sort.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simulate/src/simulations/lissajous_curve.dart';
import 'package:simulate/src/simulations/epicycloid_curve.dart';
import 'package:simulate/src/simulations/maurer_rose.dart';
import 'package:simulate/src/simulations/url_launcher.dart';
import 'package:simulate/src/simulations/video_launcher.dart';
import 'package:simulate/src/simulations/wave/wave_page.dart';

import '../simulations/give_quiz.dart';
import '../simulations/salt_analysis.dart';

class Simulations with ChangeNotifier {
  static var _favorites = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,-1,-1, -1, -1, -1,-1, -1, -1, -1, -1, -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
  final _algorithm = [29, 30, 31, 32, 33, 34];
  final _mathematics = [21, 22, 23, 24, 25, 26, 27, 28];
  final _physics = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  final _chemistry = [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  final _quiz = [35];
  final _additional = [29, 30, 31, 32, 33, 34];

  var prefs;
  final _searchTags = {
    0: "ray optics",
    1: "differnt waves",
    2: "spring motion",
    3: "projectile motion",
    4: "planetary motion",
    5: "linear momentum",
    6: "heat equation",
    7: "nuclear fusion",
    8: "solar system",
    9: "qualitative inorganic analysis",
    10: "precipitation",
    11: "organic chemical reactions",
    12: "chemical garden",
    13: "metal displacement",
    14: "bubbling",
    15: "color change",
    16: "crystalization",
    17: "dancing fluorscent droplets",
    18: "smoke",
    19: "chemical structures",
    20: "additional mathematical simulation",
    21: "chemical structures",
    22: "graph plotting",
    23: "rose pattern",
    24: "fourier series",
    25: "lissajous pattern",
    26: "epicyloid pattern pencil of lines",
    27: "epicycloid curve",
    28: "maurer rose pattern",
    29: "special relativity",
    30: "quantum logic gates",
    31: "toothpick pattern",
    32: "bubble sort",
    33: "insertion sort",
    34: "selection sort",
    35: "quiz",
  };

  Simulations() {
    getFavorites();
  }

  getFavorites() async {
    prefs = await SharedPreferences.getInstance();
    List<String> myList = (prefs.getStringList('favorites') ?? <String>[]);
    if (myList.length != 0) {
      _favorites = myList.map((i) => int.parse(i)).toList();
      if (allSimulations().length > _favorites.length) {
        _favorites = List.from(_favorites)
          ..addAll(
              List.filled(allSimulations().length - _favorites.length, -1));
      }
    }
  }

  List<Widget> allSimulations() {
    final theme = ThemeProvider(prefs);
    return <Widget>[
            SimulationCard(
        id: 0,
        simulationName: 'Ray Optics',
        image: theme.darkTheme
            ? 'assets/simulations/RayopticsDark.png' //Dark
            : 'assets/simulations/RayopticsLight.png',  //light
        direct: OpticsPage(),
        infoLink: 'https://en.wikipedia.org/wiki/Selection_sort',
        fav: _favorites[0],
      ),
      SimulationCard(
        id: 1,
        simulationName: 'Differnt Waves',
        image: theme.darkTheme
            ? 'assets/simulations/WavesDark.png'
            : 'assets/simulations/WavesLight.png',
        direct: WavePage(),
        infoLink: 'https://en.wikipedia.org/wiki/Selection_sort',
        fav: _favorites[1],
      ),
            SimulationCard(
        id: 2,
        simulationName: 'Spring Motion',
        image: theme.darkTheme
            ? 'assets/simulations/SpringLight.png'      //Quiz Image
            : 'assets/simulations/SpringDark.png',
        direct: UrlLauncher(name: "Spring Motion", url: "https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/projectile_motion/simulation.html',
        fav: _favorites[2]
      ),
            SimulationCard(
        id: 3,
        simulationName: 'Projectile Motion',
        image: theme.darkTheme
            ? 'assets/simulations/ProjectileDark.png'      //Quiz Image
            : 'assets/simulations/ProjectileDark.png',
        direct: UrlLauncher(name: "Projectile Motion", url: "https://dazzler12.github.io/PhysicsSimulations/projectile_motion/simulation.html"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/projectile_motion/simulation.html',
        fav: _favorites[3]
      ),      SimulationCard(
        id: 4,
        simulationName: 'Planetary Motion',
        image: theme.darkTheme
            ? 'assets/simulations/Planetary.png'      //Quiz Image
            : 'assets/simulations/Planetary.png',
        direct: UrlLauncher(name: "Planetary Motion", url: "https://dazzler12.github.io/PhysicsSimulations/planetary_motion/simulation.html"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/planetary_motion/simulation.html',
        fav: _favorites[4]
      ),      SimulationCard(
        id: 5,
        simulationName: 'Linear Momentum',
        image: theme.darkTheme
            ? 'assets/simulations/Momentum.png'      //Quiz Image
            : 'assets/simulations/Momentum.png',
        direct: UrlLauncher(name: "Linear Momentum", url: "https://dazzler12.github.io/PhysicsSimulations/linear_momentum/simulation.html"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/linear_momentum/simulation.html',
        fav: _favorites[5]
      ),      SimulationCard(
        id: 6,
        simulationName: 'Heat Equation (1D)',
        image: theme.darkTheme
            ? 'assets/simulations/Heat.png'      //Quiz Image
            : 'assets/simulations/Heat.png',
        direct: UrlLauncher(name: "Heat Equation", url: "https://dazzler12.github.io/PhysicsSimulations/heat_equation/simulation.html"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/heat_equation/simulation.html',
        fav: _favorites[6]
      ),      SimulationCard(
        id: 7,
        simulationName: 'Nuclear Fusion',
        image: theme.darkTheme
            ? 'assets/simulations/Nuclear.png'      //Quiz Image
            : 'assets/simulations/Nuclear.png',
        direct: UrlLauncher(name: "Nuclear Fusion", url: "https://dazzler12.github.io/PhysicsSimulations/nuclear_fusion/simulation.html"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/nuclear_fusion/simulation.html',
        fav: _favorites[7]
      ),
            SimulationCard(
        id: 8,
        simulationName: 'Solar System',
        image: theme.darkTheme
            ? 'assets/simulations/SolarSystem.png'      //Chemical Instruments Images
            : 'assets/simulations/SolarSystem.png',
        direct: UrlLauncher(name: "Solar System", url: "https://dazzler12.github.io/SolarSystem/"), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[8]
      ),


      SimulationCard(
        id: 9,
        simulationName: 'Qualitative Inorganic Analysis',
        image: theme.darkTheme
            ? 'assets/simulations/SaltLight.png'  //chemistry Image
            : 'assets/simulations/SaltLight.png',
        direct: UrlLauncher(name: "Qualitative Inorganic Analysis", url: "https://dazzler12.github.io/PhysicsSimulations/"),
        infoLink: 'https://en.wikipedia.org/wiki/Qualitative_inorganic_analysis',
        fav: _favorites[9]
      ),

     SimulationCard(
        id: 10,
        simulationName: 'Precipitation',
        image: theme.darkTheme
            ? 'assets/simulations/Precipitation.png'      //Precepitation image
            : 'assets/simulations/Precipitation.png',
        direct: VideoLauncher(name: "Precipitation", url: "https://player.vimeo.com/video/106810691?h=1c9442d175", desc: "This video features 5 precipitation reactions, each with its own “personality”. In a typical demonstration of precipitation reactions, we see a transparent solution in a test tube at the beginning and a cloudy liquid at the end after adding a few droplets of another solution. However, when we used cubic glass cells to replace test tubes and took a much closer look, their unique beauty was revealed."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[10]
      ),

      SimulationCard(
        id: 11,
        simulationName: 'Organic Chemical Reactions',
        image: theme.darkTheme
            ? 'assets/simulations/OrganicDark.png'      //Quiz Image
            : 'assets/simulations/OrganicDark.png',
        direct: UrlLauncher(name: "Organic Chemical Reactions", url: "https://chem.libretexts.org/Bookshelves/General_Chemistry/Map%3A_General_Chemistry_(Petrucci_et_al.)/27%3A_Reactions_of_Organic_Compounds/27.01%3A_Organic_Reactions%3A_An_Introduction"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/linear_momentum/simulation.html',
        fav: _favorites[11]
      ),
SimulationCard( //Chemical Garden
        id: 12,
        simulationName: 'Chemical Garden',
        image: theme.darkTheme
            ? 'assets/simulations/GardenDark.png'      //Chemical Garden Image
            : 'assets/simulations/GardenDark.png',
        direct: VideoLauncher(name: "Chemical Garden", url: "https://player.vimeo.com/video/106809656?h=71c5328bb5",desc: "This is our take of a popular chemical experiment showing the wonder of chemistry. The reaction occurred when a piece of metal salt was dropped in water glass (water solution of sodium silicate, Na2SiO3). The salt began to grow and generate many interesting forms due to the formation of water-permeable metal silicate membranes and osmotic effects."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[12]
      ),

      //Metal Displacement
      SimulationCard( //Metal Displacement
        id: 13,
        simulationName: 'Metal Displacement',
        image: theme.darkTheme
            ? 'assets/simulations/MatelDark.png'      //Metal Displacement Image
            : 'assets/simulations/MatelDark.png',
        direct: VideoLauncher(name: "Metal Displacement", url: "https://player.vimeo.com/video/106807484?h=7842785c53",desc: "We dropped zinc metal in silver nitrate (AgNO3), copper sulfate (CuSO4), and lead nitrate (Pb(NO3)2) solutions, and recorded the emergence of silver, copper, and lead metals with beautiful structure. To preserve the fragile structure of lead metal, we also added sodium silicate (Na2SiO3) and acetic acid (CH3COOH) to the solution to make it gelatinize."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[13]
      ),

      //Bubbling
      SimulationCard( //Bubbling
        id: 14,
        simulationName: 'Bubbling',
        image: theme.darkTheme
            ? 'assets/simulations/BubblingDark.png'      //Bubbling
            : 'assets/simulations/BubblingDark.png',
        direct: VideoLauncher(name: "Bubbling", url: "https://player.vimeo.com/video/106806525?h=2b157d20ad",desc: "Many chemical reactions generate gases. In solution, gases escape as bubbles. Here we show 4 bubbling reactions. The last one is the electrolysis of sodium hydroxide (NaOH) aqueous solution. It is obvious that the reaction generated more hydrogen (H2) at the cathode than oxygen (O2) at the anode. In fact, the ideal volume ratio is H2 : O2 = 2 : 1."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[14]
      ),

      //Color Change
      SimulationCard( //Bubbling
        id: 15,
        simulationName: 'Color Change',
        image: theme.darkTheme
            ? 'assets/simulations/ColorDark.png'      //Color Change
            : 'assets/simulations/ColorDark.png',
        direct: VideoLauncher(name: "Color Change", url: "https://player.vimeo.com/video/106808368?h=fd73f516c1",desc: "The molecules inside some plants giving them vibrant colors can change to other colors under acid and base conditions. What we show here is color change of purple cabbage and a flower named Teornia fournieri in sodium hydroxide (NaOH) and hydrochloric acid (HCl) solutions."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[15]
      ),

      //Crystallization
        SimulationCard( //Crystallization
        id: 16,
        simulationName: 'Crystallization',
        image: theme.darkTheme
            ? 'assets/simulations/ColorDark.png'      //Crystallization
            : 'assets/simulations/ColorDark.png',
        direct: VideoLauncher(name: "Crystallization", url: "https://player.vimeo.com/video/106807085?h=06144652f0",desc: "Crystals are beautiful, both externally at the macroscopic level and internally at the atomic level. The same is true for the process of crystallization, which is the formation and growth of crystals. This video shows the crystallization of copper sulfate (CuSO4), sodium thiosulfate (Na2S2O3), potassium ferrioxalate (K3[Fe(C2O4)3]), and sodium acetate (CH3COONa). More accurately, these crystals all have water molecules inside them. Their chemical formulas are CuSO4·5H2O, Na2S2O3·5H2O, K3[Fe(C2O4)3]·3H2O, and CH3COONa·3H2O."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[16]
      ),

      // Dancing Fluorescent Droplets
    SimulationCard( //Dancing Fluorescent Droplets
        id: 17,
        simulationName: 'Dancing Fluorescent Droplets',
        image: theme.darkTheme
            ? 'assets/simulations/DropletDark.png'      //Dancing Fluorescent Droplets
            : 'assets/simulations/DropletDark.png',
        direct: VideoLauncher(name: "Dancing Fluorescent Droplets", url: "https://player.vimeo.com/video/106805144?h=7b2f7938eb",desc: "We mixed the oily chemicals inside fluorescent sticks, then added sodium hydroxide (NaOH) solution to the mixture, which was inspired by Mr. Theodore Gray's Mad Science 2. What we got was something interesting: colorful fluorescent droplets with dynamic movements."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[17]
      ),

      //Smoke
      SimulationCard( //Smoke
        id: 18,
        simulationName: 'Smoke',
        image: theme.darkTheme
            ? 'assets/simulations/smokedark.png'      //Smoke
            : 'assets/simulations/smokedark.png',
        direct: VideoLauncher(name: "Smoke", url: "https://player.vimeo.com/video/106804057?h=9b6f89d54a",desc: "We showed 3 different kinds of smoke in this video: the black smoke of candle soot darkening a sheet of transparent glass, the smoke from incense burning (the smell was nice), and the ammonium chloride (NH4Cl) smoke formed when hydrogen chloride (HCl) gas and ammonia (NH3) gas came together (the smell was terrible)."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[18]
      ),

      //Know about chemical instrments//
      SimulationCard(
        id: 19,
        simulationName: 'Chemical Instruments',
        image: theme.darkTheme
            ? 'assets/simulations/InstrumentDark.png'      //Chemical Instruments Images
            : 'assets/simulations/InstrumentDark.png',
        direct: UrlLauncher(name: "Chemical Instruments", url: "https://www.beautifulchemistry.net/beautiful-instrument"),
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/projectile_motion/simulation.html',
        fav: _favorites[19]
      ),

            SimulationCard(
        id: 21,
        simulationName: 'Chemical Structures',
        image: theme.darkTheme
            ? 'assets/simulations/Structuredark.png'      //Chemical Instruments Images
            : 'assets/simulations/Structuredark.png',
        direct: VideoLauncher(name: "Chemical Structures", url: "https://player.vimeo.com/video/107550235?h=8cf695248d",desc: "This is a short animation to express their impression of chemical structures."), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[21]
      ),

      SimulationCard(
        id: 20,
        simulationName: 'Additional Mathematical Simulation',
        image: theme.darkTheme
            ? 'assets/simulations/AdditionalDark.png'
            : 'assets/simulations/AdditionalLight.png',
        direct: UrlLauncher(name: "Additional Mathematical Simulation", url: "https://dazzler12.github.io/AdditionalMathsSimulation/"),
        infoLink: 'https://en.wikipedia.org/wiki/Selection_sort',
        fav: _favorites[20],
      ),



      SimulationCard(
        id: 22,
        simulationName: 'Graph Plotting',
        image: theme.darkTheme
            ? 'assets/simulations/GraphDark.png'
            : 'assets/simulations/GraphLight.png',
        direct: UrlLauncher(name: "Graph Plotting", url: "https://dazzler12.github.io/GraphSimulation/"),
        infoLink: 'https://en.wikipedia.org/wiki/Selection_sort',
        fav: _favorites[22],
      ),
      SimulationCard(
        id: 23,
        simulationName: 'Rose Pattern',
        image: theme.darkTheme
            ? 'assets/simulations/RosePatternDark.png'
            : 'assets/simulations/RosePatternLight.png',
        direct: RosePattern(),
        infoLink: 'https://en.wikipedia.org/wiki/Rose_(mathematics)',
        fav: _favorites[23],
      ),
      SimulationCard(
        id: 24,
        simulationName: 'Fourier Series',
        image: theme.darkTheme
            ? 'assets/simulations/FourierSeriesDark.png'
            : 'assets/simulations/FourierSeriesLight.png',
        direct: FourierSeries(),
        infoLink: 'https://en.wikipedia.org/wiki/Fourier_series',
        fav: _favorites[24],
      ),
      SimulationCard(
        id: 25,
        simulationName: 'Lissajous Pattern',
        image: theme.darkTheme
            ? 'assets/simulations/LissajousCurveDark.png'
            : 'assets/simulations/LissajousCurveLight.png',
        direct: LissajousCurve(),
        infoLink: 'https://en.wikipedia.org/wiki/Lissajous_curve',
        fav: _favorites[25],
      ),
      SimulationCard(
        id: 26,
        simulationName: 'Epicycloid Pattern (Pencil of Lines)',
        image: theme.darkTheme
            ? 'assets/simulations/Epicycloid1Dark.png'
            : 'assets/simulations/Epicycloid1Light.png',
        direct: EpicycloidCurve(),
        infoLink: 'https://en.wikipedia.org/wiki/Epicycloid',
        fav: _favorites[26],
      ),
      SimulationCard(
        id: 27,
        simulationName: 'Epicycloid Curve',
        image: theme.darkTheme
            ? 'assets/simulations/EpicycloidDark.png'
            : 'assets/simulations/Epicycloid.png',
        direct: NormalEpicycloidCurve(),
        infoLink: 'https://en.wikipedia.org/wiki/Epicycloid',
        fav: _favorites[27],
      ),
      SimulationCard(
        id: 28,
        simulationName: 'Maurer Rose Pattern',
        image: theme.darkTheme
            ? 'assets/simulations/MaurerRoseDark.png'
            : 'assets/simulations/MaurerRoseLight.png',
        direct: MaurerRoseCurve(),
        infoLink: 'https://en.wikipedia.org/wiki/Maurer_rose',
        fav: _favorites[28],
      ),

      SimulationCard(
        id: 29,
        simulationName: 'Special Relativity',
        image: theme.darkTheme
            ? 'assets/simulations/RelativityDark.png'      //Chemical Instruments Images
            : 'assets/simulations/RelativityDark.png',
        direct: UrlLauncher(name: "Special Relativity", url: "https://dazzler12.github.io/PhysicsSimulations/special_relativity/simulation.html"), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[29]
      ),


      //Quantum Logic Gates card in advance section
      SimulationCard(
        id: 30,
        simulationName: 'Quantum Logic Gates',
        image: theme.darkTheme
            ? 'assets/simulations/GatesDark.png'      //Chemical Instruments Images
            : 'assets/simulations/GatesDark.png',
        direct: UrlLauncher(name: "Quantum Logic Gates", url: "https://dazzler12.github.io/PhysicsSimulations/quantum_logic/simulation.html"), 
         infoLink: 'https://dazzler12.github.io/PhysicsSimulations/spring_motion/simulation.html',
        fav: _favorites[30]
      ),


            SimulationCard(
        id: 31,
        simulationName: 'Toothpick Pattern',
        image: theme.darkTheme
            ? 'assets/simulations/ToothpickPatternDark.png'
            : 'assets/simulations/ToothpickPatternLight.png',
        direct: ToothpickPattern(),
        infoLink: 'https://en.wikipedia.org/wiki/Toothpick_sequence',
        fav: _favorites[31],
      ),
      SimulationCard(
        id: 32,
        simulationName: 'Bubble Sort ',
        image: theme.darkTheme
            ? 'assets/simulations/BubbleDark.png'
            : 'assets/simulations/BubbleLight.png',
        direct: BubbleSortBars(),
        infoLink: 'https://en.wikipedia.org/wiki/Bubble_sort',
        fav: _favorites[32],
      ),
      SimulationCard(
        id: 33,
        simulationName: 'Insertion Sort',
        image: theme.darkTheme
            ? 'assets/simulations/InsertionDark.png'
            : 'assets/simulations/InsertionLight.png',
        direct: InsertionHome(),
        infoLink: 'https://en.wikipedia.org/wiki/Insertion_sort',
        fav: _favorites[33],
      ),

      SimulationCard(
        id: 34,
        simulationName: 'Selection Sort',
        image: theme.darkTheme
            ? 'assets/simulations/SelectionDark.png'
            : 'assets/simulations/SelectionLight.png',
        direct: SelectionSortBars(),
        infoLink: 'https://en.wikipedia.org/wiki/Selection_sort',
        fav: _favorites[34],
      ),

      SimulationCard(
        id: 35,
        simulationName: 'Quiz',
        image: theme.darkTheme
            ? 'assets/simulations/QuizLight.png'      //Quiz Image
            : 'assets/simulations/QuizLight.png',
        direct: Quiz(),
         infoLink: 'quizz',
        fav: _favorites[35]
      ),
    ];
  }

  List<Widget> get all {
    getFavorites();
    return allSimulations();
  }

  List<Widget> get physics {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _physics.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  List<Widget> get algorithms {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _algorithm.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  

  List<Widget> get mathematics {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _mathematics.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  List<Widget> get chemistry {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _chemistry.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  List<Widget> get quiz {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _quiz.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  //for Additional section
  List<Widget> get advance{
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _additional.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  List<Widget> get favorites {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    for (int i = 0; i < _favorites.length; ++i) {
      if (_favorites[i] == 1) {
        widgets.add(allWidgets[i]);
      }
    }
    return widgets;
  }

  List<Widget> searchSims(String query) {
    query = query.toLowerCase();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    final regex = RegExp('$query[a-z]* ');
    _searchTags.forEach((key, tags) {
      if (regex.hasMatch(tags)) {
        widgets.add(allWidgets[key]);
      }
    });
    return widgets;
  }

  void toggleFavorite(int index) async {
    _favorites[index] *= -1;
    List<String> favorites = _favorites.map((i) => i.toString()).toList();
    await prefs.setStringList('favorites', favorites);
    notifyListeners();
  }
}
