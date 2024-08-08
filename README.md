# August Project

The August Project uses SwiftUI to build a simple two-page application that searches flickr for images matching the provided query. Tapping on one of the grid images will push a detail view with a larger image and more details.

![AugustImg1](https://github.com/user-attachments/assets/4347bf26-ee50-4871-96dc-92827b976eae)
![AugustImg2](https://github.com/user-attachments/assets/c537c8c4-76e0-474b-a8f1-8ba5b59a0ab1)

## Points of Interest

- simple design system to assign token and some component styling
- tested regex function to filter data from html string
- documented network manager with custom error handling
- grid column count based on user's text size
- images have alt text for accessibility

## Things that went well

- design system works well and can be applied throughout the app
- accessibility for grid works well in both portrait and landscape
- search screen layouts for different states

## Things to do

- fix issue where grid image corner radius is ignored when set to `.fill`
- enable Dark Mode
- save cache of recent searches and add auto-complete suggestions
- add link to open webview to flickr page from DetailView
