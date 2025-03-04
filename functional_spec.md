# Functional Specification: Water Calculator

## Introduction

The **Water Intake Calculator** is now a web-based application designed to help users determine their daily water intake. By considering factors like body weight, physical activity, real-time temperature (via WeatherStack API), and pregnancy or breastfeeding status, the app provides a personalized hydration recommendation. This ensures users stay hydrated and maintain their health in different conditions.


## User Stories

### User Story 1: Calculate Daily Water Intake
**As a** health-conscious individual,  
**I want to** calculate the amount of water I should drink daily,  
**so that** I can stay hydrated based on my personal needs.

### User Story 2: Glasses of Water Conversion
**As a** user who prefers smaller, actionable goals,  
**I want to** see my daily intake in terms of 8-ounce glasses,  
**so that** I can measure and track my water consumption more easily.

### User Story 3: Automatic Temperature Fetching
**As a** user who doesn’t want to manually enter the temperature,
**I want to** enter my city and have the app fetch the current weather,
**so that** my hydration recommendation is more accurate.


### User Interface
- The application is a Sinatra web app, accessible via a web browser.
Users input their data through an interactive form.
Weather data is automatically fetched based on the user’s city.
Results are displayed instantly on a results page.


### Commands/Interactions
1. **User Input Prompts:**
   - Name
   - Weight (in pounds)
   - Minutes exercised
   - Current temperature
   - Pregnancy or breastfeeding status


### Flow of Interactions
**Homepage (/)**
Users enter their name and click "Continue."
Redirects to /water/new.
**Water Intake Calculator Form (/water/new)**
Users input:
- Weight (in pounds)
- Minutes exercised
- City (for automatic temperature lookup)
- Pregnancy/breastfeeding status

*The app fetches the current temperature for the entered city using WeatherStack API.*
- Users click "See Results!" to proceed.
**Results Page (/water/results)**
Displays personalized water intake recommendations:
- Total ounces of water needed
-Equivalent number of 8-ounce glasses
-Includes a "Start Over" button to return to the homepage.
