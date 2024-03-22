import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class ContinueButton extends StatelessWidget {
  final Function onPress;
  final Widget child;
  final double padding;
  const ContinueButton(
      {super.key,
      required this.onPress,
      required this.child,
      this.padding = 20});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(padding)),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF8E6CEF)),
        ),
        onPressed: () => onPress(),
        child: child);
  }
}

class ChoiceButton extends StatefulWidget {
  final String title;
  final List<dynamic> values;
  final List<Widget> representations;
  final List<Widget> choices;

  const ChoiceButton(
      {super.key,
      required this.values,
      required this.representations,
      required this.choices,
      required this.title});
  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  late Widget _currentChoice;
  late dynamic _value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentChoice = widget.representations[0];
    _value = widget.values[0];
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Color(0xF4F4F4).withOpacity(1)),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Use min to make the bottom sheet only as tall as its content
                children: <Widget>[
                  // Add a title at the top of the bottom sheet
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Add a divider for better visual separation
                  Divider(color: Colors.grey),
                  // Your existing ListView.builder
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.representations.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            tileColor: Colors.black.withOpacity(0.05),
                            hoverColor: Color(0xFF8E6CEF).withOpacity(1),
                            
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none),
                            title: widget.choices[index],
                            onTap: () {
                              setState(() {
                                _currentChoice = widget.representations[index];
                                _value = widget.values[index];
                              });
                              print("selected : ${widget.values[index]}");
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _currentChoice,
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_downward),
            ],
          )
        ],
      ),
    );
  }
}

// ListView(
//                 children: <Widget>[
//                  ListTile(
//                     title: Text('Small'),
//                     onTap: () {
//                       setState(() {
//                         _currentChoice = Text("S");
//                       });
//                       Navigator.pop(context);
//                       // Handle the selection of 'Small'
//                     },
//                  ),
//                  ListTile(
//                     title: Text('Medium'),
//                     onTap: () {
//                        setState(() {
//                         _currentChoice = Text("M");
//                       });
//                       Navigator.pop(context);
//                       // Handle the selection of 'Medium'
//                     },
//                  ),
//                  ListTile(
//                     title: Text('Large'),
//                     onTap: () {
//                        setState(() {
//                         _currentChoice =Text("L");
//                       });
//                       Navigator.pop(context);
//                       // Handle the selection of 'Large'
//                     },
//                  ),
//                 ],
//               ),

class HeartButton extends StatefulWidget {
  final dynamic event;
  const HeartButton({super.key, this.event});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool _liked = false;
  String _link = "lib/assets/images/Vector.png";
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ImageIcon(
        AssetImage(_link),
        color: Colors.red,
        size: 40, // Adjust the size as needed
      ),
      onPressed: () {
        setState(() {
          _liked = !_liked;
          _link = _liked
              ? "lib/assets/images/heart.png"
              : "lib/assets/images/Vector.png";
        });
      },
    );
  }
}


class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6).copyWith(right: 20, left: 20),
      decoration: BoxDecoration(
          color: Color(0xF4F4F4).withOpacity(1),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Quantity", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          Row(
            children: [
              ContinueButton(
                  onPress: () {
                    setState(() {
                      _quantity += 1;
                    });
                  },
                  child: Icon(Icons.add)),
              SizedBox(
                width: 10,
              ),
              Text("$_quantity"),
              SizedBox(
                width: 10,
              ),
              ContinueButton(
                  padding: 20,
                  onPress: () {
                    setState(() {
                      if (_quantity > 1) _quantity -= 1;
                    });
                  },
                  child: Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
