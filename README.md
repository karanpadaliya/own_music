# Media Booster (Own Music)

## Project Definition
Media Booster is a media player application developed using the Flutter framework. This app aims to enhance the media playback experience for users, featuring an audio player, video player, carousel slider functionalities, and a tab bar view. The project is designed to improve the knowledge and skills of IT students in mobile app development using Flutter.

## Project Description
The Media Booster app provides a comprehensive media playback experience, enabling users to play both audio and video files. It includes features such as playback controls, a carousel slider for swiping between multiple media files, and a tab bar view for easy navigation between audio and video player pages. The application is optimized for performance and user experience, showcasing best practices in mobile app development with Flutter.

## Project Objectives
- Develop a media player application using the Flutter framework.
- Implement an audio player with playback controls.
- Implement a video player with playback controls.
- Implement a carousel slider functionality for swiping between multiple audio and video files.
- Implement a tab bar view for navigating between audio and video player pages.
- Provide detailed pages for each audio and video file with playback controls.
- Optimize the application for performance and user experience.
- Enhance the knowledge and skills of IT students in mobile app development using Flutter.

## Project Technologies
- **Language:** Dart
- **Framework:** Flutter with MVC and Provider architecture
- **Libraries Used:**
  - `cupertino_icons: ^1.0.2`
  - `carousel_slider: ^4.2.1`
  - `audioplayers: ^5.2.1`
  - `video_player: ^2.8.5`
  - `chewie: ^1.7.5`
  - `shared_preferences: ^2.2.3`
  - `local_auth: ^2.1.8`

## Project Requirements
- Proficiency in Dart programming language.
- Familiarity with the Flutter framework and media player technologies.
- Understanding of user interface design principles and best practices.
- Experience with mobile app development tools such as Android Studio or VS Code.
- Ability to work independently.

## Project Structure

### Assets
<pre>
  <code>
assets
├── fonts
│ ├── EduTASBeginner-VariableFont_wght.ttf
│ └── LXGWWenKaiMonoTC-Regular.ttf
└── images
├── SplashScreenIcon
├── backImg.png
├── Logo_png.png
├── musicBackground.gif
└── no_favourite_found.png

### Library (lib)

lib
├── controller
│ ├── ArtistsController.dart
│ └── SliderController.dart
├── modal
│ └── ArtistsModal.dart
├── view
│ ├── Components
│ │ ├── ArtistDetailPage.dart
│ │ ├── ArtistsPage.dart
│ │ └── CarouselSlider.dart
│ ├── Pages
│ │ ├── IntroductionPages
│ │ │ └── SplashScreen.dart
│ │ ├── LoginPages
│ │ │ ├── LoginPage.dart
│ │ │ └── SignUpPage.dart
│ │ └── SongPlayPages
│ │ ├── SingleSongPlayPage.dart
│ │ ├── AudioPage.dart
│ │ ├── CategoryPage.dart
│ │ ├── FavouritePage.dart
│ │ ├── HomePage.dart
│ │ ├── ProfilePage.dart
│ │ └── VideoPage.dart
│ └── main.dart
  </code>
</pre>

## Installation Instructions
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/mediabooster.git
    cd mediabooster
    ```
2. Install dependencies:
    ```bash
    flutter pub get
    ```
3. Run the application:
    ```bash
    flutter run
    ```

## Usage

### Screenshots and GIFs
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/e22f1de8-0f79-4e10-be23-1828da9aeef7" alt="1" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/33d9defe-de61-4210-b554-c13387730621" alt="2" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/e70709a6-0e6b-4be4-8731-29d9fa95599f" alt="3" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/402499ac-4f59-42a3-bdd4-d0145af0ddfa" alt="4" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/d5d565dc-3bcb-48cb-b04e-1b9081424259" alt="5" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/b03587a1-b0dc-4dc4-8600-23714f4e3f0e" alt="6" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/c5b19f5c-029d-4bd5-aa16-714959cc50b5" alt="7" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/6dab05df-37c6-4798-b879-0a8ee14c90e6" alt="8" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/87bd6f4d-d855-4f73-a2ed-337fdd80f063" alt="9" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/071e014d-e862-4c8c-85e1-a3de5a5e7d3c" alt="10" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/66e4bc6e-c1d7-492e-8034-9f5581c8a87e" alt="11" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/50bc391f-19d4-4883-9d84-9aee952330fb" alt="12" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/d51f8df3-3ae0-4168-8c37-f64913531157" alt="13" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/bd9ef141-474b-4d7b-b280-de72095790f2" alt="14" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/6d211f59-323f-4997-855e-f2b820d77c01" alt="15" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/5d7ff7d8-5dca-483d-adc1-087e013252f4" alt="16" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/706ddcbe-324e-41de-b6f4-61114829d540" alt="17" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/ff344163-951d-434d-a3c4-768712257db8" alt="18" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/5bcd403a-2600-4f40-959d-79f7841453ea" alt="19" style="width: 200px; height: 450px;"> 
<img src="https://github.com/karanpadaliya/own_music/assets/72498188/ed32c584-37e1-4f58-9ab9-49a190a4b825" alt="20" style="width: 200px; height: 450px;">

### Features
- **Audio Player:** Play audio files with playback controls.
- **Video Player:** Play video files with playback controls.
- **Carousel Slider:** Swipe between multiple audio and video files.
- **Tab Bar View:** Navigate between audio player and video player pages.
- **Detail Pages:** Detailed view for each audio and video file with playback controls.

## Project Deliverables
- Functional media player application.
- Source code and documentation.
- User manual and installation instructions.
- Project report detailing the development process, challenges faced, and solutions implemented.
- Presentation and demonstration to a panel of reviewers.

## Project Evaluation
- User satisfaction with the application’s functionality and UI/UX.
- Quality of code and project structure.
- Presentation quality and clarity of communication.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
- Special thanks to the instructors and mentors for their guidance.
- Thanks to the open-source community for the resources and libraries used in this project.
