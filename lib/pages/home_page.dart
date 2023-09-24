import 'package:flutter/material.dart';
import 'package:mode_rutinitas/model/mode_data.dart';
import 'package:mode_rutinitas/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mode Aktivitas'),
        backgroundColor: Colors.indigo[800],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const ModeList();
          } else if (constraints.maxWidth <= 750) {
            return const ModeGrid(gridCount: 2);
            // return TourismPlaceGrid(gridCount: 4);
          } else if (constraints.maxWidth <= 950) {
            return const ModeGrid(gridCount: 3);
            // return TourismPlaceGrid(gridCount: 4);
          } else if (constraints.maxWidth <= 1400) {
            return const ModeGrid(gridCount: 4);
            // return TourismPlaceGrid(gridCount: 4);
          } else {
            return const ModeGrid(gridCount: 6);
            // return TourismPlaceGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class ModeList extends StatelessWidget {
  const ModeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pilih mode berdasarkan hal yang sedang Anda lakukan atau lokasi Anda. Mode akan mengoptimalkan pengalaman Anda dengan menyesuaikan pengaturan ponsel Anda.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final ModeData modeData = modeDataList[index];
                return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(modeData: modeData);
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  color: modeData.color,
                                  child: Icon(
                                    modeData.iconData,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // title
                                  Text(
                                    modeData.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // subtitle
                                  Text(
                                    modeData.shortDescription,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ));
              },
              itemCount: modeDataList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ModeGrid extends StatelessWidget {
  final int gridCount;

  const ModeGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pilih mode berdasarkan hal yang sedang Anda lakukan atau lokasi Anda. Mode akan mengoptimalkan pengalaman Anda dengan menyesuaikan pengaturan ponsel Anda.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(24),
            child: GridView.count(
              crossAxisCount: gridCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: modeDataList.map((modeData) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(modeData: modeData);
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  color: modeData.color,
                                  child: Icon(
                                    modeData.iconData,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              // title
                              Text(
                                modeData.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // subtitle
                              Text(
                                modeData.shortDescription,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          )),
                    ));
              }).toList(),
            ),
          )),
        ],
      ),
    );
  }
}
