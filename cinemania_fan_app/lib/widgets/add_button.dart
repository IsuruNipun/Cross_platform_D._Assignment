import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({Key? key}) : super(key: key);

  // void _showAddOptionsDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
          
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             ElevatedButton(
  //               onPressed: () {
  //                 // TODO: Implement your logic for adding to wish list here
  //                 Navigator.of(context).pop(); // Closes the dialog
  //                 print("  Added to Wish List  "); // Placeholder action
  //               },
  //               child: const Text("Add to Wish List"),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 // TODO: Implement your logic for adding to watched list here
  //                 Navigator.of(context).pop(); // Closes the dialog
  //                 print("Added to Watched List"); // Placeholder action
  //               },
  //               child: const Text("Add to Watched List"),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  void _showAddOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center, // Adjust the alignment as needed
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Closes the dialog
                    print("Added to Wish List"); // Placeholder action
                  },
                  child: const Text("Add to Wish List"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(180, 40), // Specify the size here
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Closes the dialog
                    print("Added to Watched List"); // Placeholder action
                  },
                  child: const Text("Add to Watched List"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(130, 40), // Specify the size here
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddOptionsDialog(context),
      child: const Icon(Icons.add),backgroundColor: Colors.black,
      shape: CircleBorder(),
      tooltip: 'Add',
    );
  }
}

