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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // icon dan judul
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
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      // gambar ukuran height 300
                      const SizedBox(height: 20.0),
                      Image.asset(modeData.imageAsset, height: 300.0),

                      // deskripsi
                      const SizedBox(height: 20.0),
                      Text(
                        modeData.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                      ),

                      // tombol
                      const SizedBox(height: 20.0),
                      const Center(child: ActiveButton()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
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
