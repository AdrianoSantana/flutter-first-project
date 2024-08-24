import 'package:first_app/components/dificulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String title;
  final int dificulty;
  final String? image;

  Task({
    super.key,
    required this.title,
    required this.dificulty,
    this.image,
  });

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  double calculateNivelValue() {
    int dificultRate = widget.dificulty > 0 ? widget.dificulty : 1;
    return widget.nivel / (dificultRate * 2);
  }

  Widget assetOrNetwork() {
    if (widget.image != null && widget.image!.contains('http')) {
      return Image.network(widget.image!, fit: BoxFit.fill);
    }
    return Image.asset(
      'assets/default.jpg',
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    double nivelValue = calculateNivelValue();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      color: Colors.black26,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: assetOrNetwork(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 18.0,
                              overflow: TextOverflow.ellipsis,
                              color:
                                  nivelValue > 1 ? Colors.green : Colors.black,
                            ),
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificulty,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 72,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_drop_up_outlined,
                            ),
                            Text(
                              'UP',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color:
                            nivelValue >= 1 ? Colors.greenAccent : Colors.white,
                        value: nivelValue,
                        backgroundColor: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nivel ${widget.nivel}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
