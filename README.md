# PrimeApp

Prime App inspired by PointFree SwiftUI course is an iOS application built using SwiftUI, Combine, and MVVM architecture. 

It allows users to manipulate a counter, check if a number is prime, and find the n'th prime number using WolframAlpha API. 

The app supports localization in:
- *English*,
- *Russian*.

## Features

- Increase and decrease the state binded counter.
- Check if the selected number is a prime number.
- Find the n'th prime number using WolframAlpha API with URLSession.
- Read what is prime numbers and see first 20 of them using two requests to WolframAlpha API.
- UserDefaults for storing current counter value, favorite prime numbers.
- MVVM (Model-View-ViewModel) architecture for clean and maintainable code.

## Technologies

- SwiftUI, MVVM + Combine, URLSession, UserDefaults

## Screenshots
Example of Localization: 

![Simulator Screenshot - iPhone 14 Pro - 2023-04-07 at 13 02 41 — средний размер](https://user-images.githubusercontent.com/75203988/230589810-2a347937-39a6-48cd-8d66-53861f8fbf5f.jpeg)
![Simulator Screenshot - iPhone 14 Pro - 2023-04-07 at 13 00 57 — средний размер](https://user-images.githubusercontent.com/75203988/230589596-52e6c756-da4a-4a2f-90ad-9dc6c88c7ef9.jpeg)

## GIFs
Counter, STATE binding, Checking if a number is prime or not, pluralization of suffix, add to Favorites features:

![2023-04-07 12 36 19](https://user-images.githubusercontent.com/75203988/230585518-77a99782-9bfb-45e6-bb78-0f27e6e399e8.gif)


WolframAlpha API request to find n'th prime number:

![2023-04-07 12 37 14](https://user-images.githubusercontent.com/75203988/230585642-ec300092-7d22-4756-bf1b-fbc9c6ab8cd1.gif)


Favorite Prime Numbers list:

![2023-04-07 12 37 43](https://user-images.githubusercontent.com/75203988/230585731-9fe4c979-6152-4005-b84b-442ce01b5e06.gif)


What is a prime number description & first 20 prime numbers using 2 requests to WolframAlphaAPI:

![2023-04-07 12 38 41](https://user-images.githubusercontent.com/75203988/230585876-cd1643ba-6bc6-4c76-ab13-4d7a77587104.gif)


