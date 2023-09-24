import 'package:flutter/material.dart';
import 'package:mode_rutinitas/model/mode_data.dart';

class DetailPage extends StatelessWidget {
  final ModeData modeData;

  const DetailPage({Key? key, required this.modeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWeb(modeData: modeData);
        } else {
          return DetailMobile(modeData: modeData);
        }
      },
    );
  }
}

class DetailMobile extends StatelessWidget {
  final ModeData modeData;

  const DetailMobile({Key? key, required this.modeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mode ${modeData.name}'),
        backgroundColor: modeData.color,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(modeData.iconData, color: modeData.color, size: 50.0),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  modeData.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(modeData.imageAsset),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    modeData.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ActiveButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailWeb extends StatelessWidget {
  final ModeData modeData;

  const DetailWeb({Key? key, required this.modeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mode ${modeData.name}'),
        backgroundColor: modeData.color,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(modeData.imageAsset),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(
                                    modeData.iconData,
                                    size: 35.0,
                                    color: modeData.color,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    modeData.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  modeData.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              const ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  ActiveButton(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveButton extends StatefulWidget {
  const ActiveButton({super.key});

  @override
  State<ActiveButton> createState() => _ActiveButtonState();
}

class _ActiveButtonState extends State<ActiveButton> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isActive = !isActive;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.green : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: isActive
          ? const Text('Aktifkan Mode')
          : const Text('Nonaktifkan Mode'),
    );
  }
}
