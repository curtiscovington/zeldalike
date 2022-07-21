# zeldalike

A new Flutter project. It's a game loosly based on the original Zelda 2D NES except this game
doesn't have the map to move link around. 

# OOAD-Project-6-7 CSCI-5448.
This is a repository for Project6 and 7 for CSCI-5448 Su22 

Team Members:   
Curtis Covington   
Tim Coleman     


This repo contains Flutter/Dart code to run a Zelda like game as defined in our project proposal [project 5 design](Project_Design_5.pdf): Please notes regarding project 67 submission. 

The main work that has been done thus far is described below. 
You can find the [current UML class diagram](Project_6_Current_UML_Class_Diagram.pdf) that has been implemented here. 


## Project 7 Deliverables

- [Final Report](Final_Report.pdf)
- [UML Class Diagram Project Final](UML_Class_Diagram_Project_Final.pdf)
- [Record Video](recorded_demo.mp4) 


|  Feature |  Comments |
|---|---|
| General Flutter Widget Structure | Done  | 
| Pattern for observer (using flutter based NotificationListner) | Done  | 
| Pattern for factory | Done  | 
| Pattern for singleton  | Done  | 
| Pattern for MVC  | Using Flutter UI widgets  |
| Pattern for command  | Didn't use  | 
| UI Store | Done  | 
| UI Items | Done  | 
| UI Battle | Done  | 
| Store Logic | Done | 
| Battle Logic | Done | 
| Event Logic | Done |


Below is a high level breakdown of the classes and subclasses. 

* GameState (Main): Contains the main game state for the duration of the game
* BattleScreen - UI widget to display Battle Logic
* EventScreen - UI widget to display Event Logic
* Item (Abstract)
    * Boomerang 
    * Potion
    * Wand
    * Claw
* Battle - Logic for Battle. UI references
* Event  - Logic for Event. UI references
* Store - Logic for Store. UI reference

Code compiled and tested with Flutter/Dart
Dart SDK version: 2.17.5 (stable)
Tools • Dart 2.17.5 • DevTools 2.12.2
Tested on Android Nexus 6 Emulator



## More FLutter Info Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



