import 'package:flutter/material.dart';

class StarsSection extends StatefulWidget {
  @override
  _StarsSectionState createState() => _StarsSectionState();
}

class _StarsSectionState extends State<StarsSection> {
  // ... (Copy all the star-related code starting from buildStarsSection)
  List<String> inUseStars = ["Yellow"];
  List<String> notInUseStars = ["Red", "Green", "Purple", "Orange", "Pink", "Cyan"];
  List<String> allStars = ["Gold", "Blue", "Red", "Green", "Yellow", "Purple", "Orange", "Pink", "Cyan"];



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPresetsRow(),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("In-use Stars:"),
            const SizedBox(width: 10),
            buildStarsList(inUseStars, true),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Not-in-use Stars:"),
            const SizedBox(width: 10),
            buildStarsList(notInUseStars, false),
          ],
        ),
      ],
    );
  }

  Widget buildPresetsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Presets:"),
        buildPresetButton("1 star", ["Gold"], ),
        buildPresetButton("4 stars", ["Gold", "Blue", "Red", "Green"]),
        buildPresetButton("All stars", ["Gold", "Blue", "Red", "Green", "Yellow", "Purple", "Orange", "Pink", "Cyan"]),
      ],
    );
  }

  Widget buildPresetButton(String label, List<String> stars) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          inUseStars = [...stars];
          notInUseStars = allStars.where((star) => !inUseStars.contains(star)).toList();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Text(label, style: TextStyle(color: Colors.blue),),
    );
  }

  Widget buildStarsList(List<String> stars, bool inUse) {
    return Expanded(
      child: DragTarget<String>(
        onAccept: (star) {
          setState(() {
            if (inUse && !inUseStars.contains(star)) {
              inUseStars.add(star);
              notInUseStars.remove(star);
            } else if (!inUse && !notInUseStars.contains(star)) {
              notInUseStars.add(star);
              inUseStars.remove(star);
            }
          });
        },

        builder: (context, candidateData, rejectedData) {
          return Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: stars.map((star) {
              return Draggable<String>(
                data: star,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: inUse ? Colors.transparent : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.star,
                    color: getColorForStar(star),
                  ),
                ),
                feedback: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: inUse ? Colors.yellow : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.star,
                    color: getColorForStar(star),
                  ),

                ),
                childWhenDragging: Container(),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Color getColorForStar(String star) {
    switch (star) {
      case "Gold":
        return Colors.amber;
      case "Blue":
        return Colors.blue;
      case "Red":
        return Colors.red;
      case "Green":
        return Colors.green;
      case "Yellow":
        return Colors.yellow;
      case "Purple":
        return Colors.purple;
      case "Orange":
        return Colors.orange;
      case "Pink":
        return Colors.pink;
      case "Cyan":
        return Colors.cyan;
      default:
        return Colors.black;
    }
  }

// ... (Paste the rest of the star-related code)
}



// class _StarsState extends State<Stars> {
//
//   List<String> inUseStars = ["Yellow"];
//   List<String> notInUseStars = ["Red", "Green", "Purple", "Orange", "Pink", "Cyan"];
//   @override
//   Widget buildStarsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildPresetsRow(),
//         const SizedBox(height: 20),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("In-use Stars:"),
//             const SizedBox(width: 10),
//             buildStarsList(inUseStars, true),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Not-in-use Stars:"),
//             const SizedBox(width: 10),
//             buildStarsList(notInUseStars, false),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget buildPresetsRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text("Presets:"),
//         buildPresetButton("1 star", ["Gold"], ),
//         buildPresetButton("4 stars", ["Gold", "Blue", "Red", "Green"]),
//         buildPresetButton("All stars", ["Gold", "Blue", "Red", "Green", "Yellow", "Purple", "Orange", "Pink", "Cyan"]),
//       ],
//     );
//   }
//
//   List<String> allStars = ["Gold", "Blue", "Red", "Green", "Yellow", "Purple", "Orange", "Pink", "Cyan"];
//
//   Widget buildPresetButton(String label, List<String> stars) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           inUseStars = [...stars];
//           notInUseStars = allStars.where((star) => !inUseStars.contains(star)).toList();
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//       ),
//       child: Text(label, style: TextStyle(color: Colors.blue),),
//     );
//   }
//
//   Widget buildStarsList(List<String> stars, bool inUse) {
//     return Expanded(
//       child: DragTarget<String>(
//         onAccept: (star) {
//           setState(() {
//             if (inUse && !inUseStars.contains(star)) {
//               inUseStars.add(star);
//               notInUseStars.remove(star);
//             } else if (!inUse && !notInUseStars.contains(star)) {
//               notInUseStars.add(star);
//               inUseStars.remove(star);
//             }
//           });
//         },
//
//         builder: (context, candidateData, rejectedData) {
//           return Wrap(
//             spacing: 8.0,
//             runSpacing: 8.0,
//             children: stars.map((star) {
//               return Draggable<String>(
//                 data: star,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: inUse ? Colors.transparent : Colors.transparent,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(
//                     Icons.star,
//                     color: getColorForStar(star),
//                   ),
//                 ),
//                 feedback: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: inUse ? Colors.yellow : Colors.grey,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(
//                     Icons.star,
//                     color: getColorForStar(star),
//                   ),
//
//                 ),
//                 childWhenDragging: Container(),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
//
//   Color getColorForStar(String star) {
//     switch (star) {
//       case "Gold":
//         return Colors.amber;
//       case "Blue":
//         return Colors.blue;
//       case "Red":
//         return Colors.red;
//       case "Green":
//         return Colors.green;
//       case "Yellow":
//         return Colors.yellow;
//       case "Purple":
//         return Colors.purple;
//       case "Orange":
//         return Colors.orange;
//       case "Pink":
//         return Colors.pink;
//       case "Cyan":
//         return Colors.cyan;
//       default:
//         return Colors.black;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }
