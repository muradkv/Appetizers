# Appetizer

Appetizer is a SwiftUI-based iOS application that displays a list of appetizers fetched from an API. It features dynamic image loading with caching using NSCache, error handling with custom alerts, and a loading view for a better user experience. The project showcases modular architecture with separate files for networking (NetworkManager), image loading (ImageLoader), and views (AppetizerListView, RemoteImage).
## Features
- Dynamic appetizer list with images
- Image caching and lazy loading
- Custom loading and error handling
- Modular project structure

## Tech Stack
- SwiftUI
- URLSession for networking
- NSCache for image caching
- Swift Concurrency (async/await)

## Mock API Endpoints

For testing and development purposes, this application uses static JSON files hosted online. You can use the following URLs to get the list of dishes.

| Service     | GET Endpoint URL                                      | Notes          |
| :---------- | :---------------------------------------------------- | :------------- |
| **npoint.io** | `https://api.npoint.io/dabf00be3f645918e015`                  | Primary URL    |
| **GitHub Gist** | `https://gist.githubusercontent.com/muradkv/6eb8451094b7685e672fd0724e612868/raw/cb15ee481865d7ae482154d3332d72225a9968bc/appetizers.json`  | Backup URL     |
