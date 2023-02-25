
// ignore_for_file: file_names

class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({ required this.image, required this.title, required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
    title: '  View and buy Medicine Online',
    image: 'images/Frame 104.png',
    discription: "Now you could order your medicine from nearest pharmacy from you that provide all your needs"
  ),
  OnbordingContent(
    title: 'Online Medical & HealthCare',
    image: 'images/Telemedicine_SVG 1.png',
    discription: "Now you consult your Doctors online and can get online appointments  "
  ),
  OnbordingContent(
    title: 'Get Delivery on time',
    image: 'images/Delivery_app_SVG.png',
    discription: "Search provide all nearest pharmacies that are near you, and your order will be to you in seconds"
  ),
];