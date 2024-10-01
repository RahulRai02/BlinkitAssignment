# Blinkit Clone using Swift & SwiftUI

This repository is part of a take home assignment given by Blinkit. The following layout and features were implemented for submission. After that i took this as a personal project and added various functionalties to the app thereby learning new libraries like MapKit, CoreData, AppStorage, CoreLocation.. Learnt how to manage states in a big app.. This is an ongoing app and i would include many features in future increasing my learning in SwiftUI and Swift. Checkout the app videos and App screenshots below...

## Layout & Features
* Layout
  * Vertical Product list cateogry (L1): 15 percent of screen width
  * Vertical Product list (L2): 85 percent of screen width
* Features:-
  * Selecting any item in L1 should reload the data displayed in L2.
  * Pull Down Interaction: Pulling down from 0 offset switches to above category and renders the product page L2 again.
  * Pull Up Interaction: Pulling up from maximum content offset switches to below category and renders the product page L2 again.
 

* Extras:
  * Shows the pull down & pull up progress view, to show how much is left to move to previous or next category...
  * Implemented Add to cart functionality...
  * Add to cart button animations when quantity is 0, basically maintaining persistence of buttons states accross views..
  * An Automatic Image slider on the homepage, which in future can be navigated to a new page.
  * Order Screen showing items in cart and the subtotal till now.
  * Account screen for saving user data and addresses. Used App Storage to save user data and used Core data for CRUD operation on the addresses.
  * All CRUD operation implemented on Address using Coredata.. Not explicitly mentioned in app, but to update address - Click on it.. To delete address, swipe to delete..
  * A location Bottom Sheet which demands user's current location and based on that updates the navigation bar. The Location sheet also shows a map which shows user's current location on map using MapKit.
  * Custom Navigation Bar using Preference Keys
  * Custom Tab Bar
    
  
## How to run?
1. Clone the repositry using `git clone https://github.com/RahulRai02/BlinkitAssignment.git`
2. Make sure to have XCode installed.
3. Click on BlinkitAssignment folder, inside there will be 2 things, `BlinkitDummy.xcodeproj` and `BlinkitDummy`.
4. Double Click on BlinkitDummy.xcodeproj
5. Set iOS minimum deployment target to iOS 17
6. Connect a physical device or select a device for simulator, click on the play button.

```bash
BlinkitAssignment/
├── BlinkitDummy/
│   ├── BlinkitDummy.xcodeproj
│   ├── BlinkitDummy/
│       ├── Images Dummy/
│       ├── MainViews/
│       ├── Preview Content/Preview Assets.xcassets
│       └── Utils/
```
          
## App screenshots/Video


App Video  | Main Home Page
:-------------------------:|:-------------------------:
https://github.com/user-attachments/assets/4f79bbe8-4ac8-4276-8216-8a8dbe1557d5 | ![Simulator Screenshot - iphone 11 - 2024-10-01 at 22 38 17](https://github.com/user-attachments/assets/31563eb1-786b-440f-a954-0e7582a25616) 

Location Bottom Sheet (Not enabled) |  Location Bottom Sheet(Location Enabled)
:-------------------------:|:-------------------------:
![Simulator Screenshot - iphone 11 - 2024-10-01 at 22 38 31](https://github.com/user-attachments/assets/5a379b1f-117e-4a60-8153-3235eea2bd85) | ![Simulator Screenshot - iphone 11 - 2024-10-01 at 22 38 39](https://github.com/user-attachments/assets/0c90265b-0a23-441a-b0f4-74fe368cbb85)


Order Screen (Empty Cart) |  Order Screen (Cart Filled)
:-------------------------:|:-------------------------:
![Simulator Screenshot - iphone 11 - 2024-10-01 at 23 03 23](https://github.com/user-attachments/assets/62ffa1e7-b93d-4421-a029-6a21a1447e67) | ![Simulator Screenshot - iphone 11 - 2024-10-01 at 22 39 13](https://github.com/user-attachments/assets/7a91b597-aa08-4605-8301-6cef9ed98e3d)

App Category View (Normal button state) |  App Category View (When items added to cart) 
:-------------------------:|:-------------------------:
![Simulator Screenshot - iphone 11 - 2024-10-01 at 22 39 26](https://github.com/user-attachments/assets/2ec1ff04-c126-4f92-800b-fdf3b35e6470) | ![Simulator Screenshot - iphone 11 - 2024-10-01 at 22 39 34](https://github.com/user-attachments/assets/0dc3cd58-caf2-4a9c-9638-46dc3f964b4e)


Account - User (Saved in App Storage) |  Account/ AddressView - Address(Saved in CoreData)
:-------------------------:|:-------------------------:
![Simulator Screenshot - iphone 11 - 2024-10-01 at 23 09 25](https://github.com/user-attachments/assets/7ee72973-5c1e-40c5-9aed-045fbda5fabf) | ![Simulator Screenshot - iphone 11 - 2024-10-01 at 23 09 29](https://github.com/user-attachments/assets/3d01273e-26df-4f4d-8ca7-eaa9773e0a34)


## App Video
https://github.com/user-attachments/assets/4f79bbe8-4ac8-4276-8216-8a8dbe1557d5 







