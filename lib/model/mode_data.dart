import 'package:flutter/material.dart';

class ModeData {
  String name;
  Color color;
  String shortDescription;
  String description;
  String imageAsset;
  IconData iconData;

  ModeData({
    required this.name,
    required this.iconData,
    required this.color,
    required this.shortDescription,
    required this.description,
    required this.imageAsset,
  });
}

var modeDataList = [
  ModeData(
    name: 'Bioskop',
    iconData: Icons.movie,
    color: Colors.red,
    shortDescription: 'Lihat Mode Bioskop',
    description:
        'Mode ini akan mengoptimalkan pengalaman menonton film di bioskop. Mengurangi gangguan dari notifikasi, suara, dan cahaya dari ponsel saat menonton film.',
    imageAsset: 'images/movie.png',
  ),
  ModeData(
    name: 'Mengemudi',
    iconData: Icons.directions_car,
    color: Colors.blue,
    shortDescription: 'Lihat Mode Mengemudi',
    description:
        'Mode ini akan mengoptimalkan pengalaman mengemudi Anda. Mengurangi gangguan dari notifikasi, suara, dan cahaya dari ponsel saat mengemudi.',
    imageAsset: 'images/driving.png',
  ),
  ModeData(
    name: 'Olahraga',
    iconData: Icons.sports_gymnastics,
    color: Colors.green,
    shortDescription: 'Lihat Mode Olahraga',
    description:
        'Mode ini akan mengoptimalkan pengalaman Anda saat berolahraga. Mengurangi gangguan dari notifikasi, suara, dan cahaya dari ponsel saat berolahraga.',
    imageAsset: 'images/sport.png',
  ),
  ModeData(
    name: 'Santai',
    iconData: Icons.spa,
    color: Colors.purple,
    shortDescription: 'Lihat Mode Santai',
    description:
        'Mode ini akan mengoptimalkan pengalaman Anda saat bersantai. Mengurangi gangguan dari notifikasi, suara, dan cahaya dari ponsel saat bersantai.',
    imageAsset: 'images/relaxing.png',
  ),
  ModeData(
    name: 'Kerja',
    iconData: Icons.apartment,
    color: Colors.orange,
    shortDescription: 'Lihat Mode Kerja',
    description:
        'Mode ini akan mengoptimalkan pengalaman Anda saat bekerja. Mengurangi gangguan dari notifikasi, suara, dan cahaya dari ponsel saat bekerja.',
    imageAsset: 'images/working.png',
  ),
  ModeData(
    name: 'Tidur',
    iconData: Icons.hotel,
    color: Colors.indigo,
    shortDescription: 'Lihat Mode Tidur',
    description:
        'Mode ini akan mengoptimalkan pengalaman Anda saat tidur. Mengurangi gangguan dari notifikasi, suara, dan cahaya dari ponsel saat tidur.',
    imageAsset: 'images/sleeping.png',
  ),
  ModeData(
    name: 'Lainnya',
    iconData: Icons.star,
    color: Colors.pink,
    shortDescription: 'Lihat Mode Lainnya',
    description:
        'Mode ini akan mengoptimalkan pengalaman Anda saat melakukan aktivitas lainnya. Mengurangi gangguan dari notifikasi, suara, dan cahaya dari ponsel saat melakukan aktivitas lainnya.',
    imageAsset: 'images/other.png',
  ),
];
