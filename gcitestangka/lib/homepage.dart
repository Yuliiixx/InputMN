import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _output = "";

  void _generateNumber(String sequence) {
    if (!RegExp(r'^[MN]*$').hasMatch(sequence)) {
      setState(() {
        _output = "Tidak ada nilai";
      });
      return;
    }

    List<int> hasil = [];
    List<int> stack = [];

    int angka = 1;

    for (int i = 0; i <= sequence.length; i++) {
      if (i == sequence.length || sequence[i] == 'N') {
        stack.add(angka);
        angka++;

        while (stack.isNotEmpty) {
          hasil.add(stack.removeLast());
        }
      } else if (sequence[i] == 'M') {
        stack.add(angka);
        angka++;
      }
    }

    setState(() {
      _output = hasil.join();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test GCI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                color: Colors.white, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Masukkan (M/N)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            String sequence = _controller.text;
                            _generateNumber(sequence);
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Output: $_output',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.red[900]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
