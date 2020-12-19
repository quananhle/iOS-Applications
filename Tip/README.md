## Tip Calculator App

##### Published Date: 12/19/2020

<p float="left">
<img src="Pictures/Hnet-image.gif" align="center" height="800" width="400"></a>
<kbd><a href="Pictures/main_page.png"><img src="Pictures/main_page.png" height="800" width="350" ></a></kbd>
</p>

### Application Flow Diagrams
 
* This app will calculate the tip amount from a bill amount based on the tip percentage chosen by the users.

* There are two main functions: ```Together``` to calculate the tip amount of the entire bill amount (scenario when a bill is paid in full by one person), and ```Separate``` to calculate tip amount from each person paying separately in a party and display the total tip amount, total paid.

* The left bar button ```Clear``` will reset all input and value to original

* The right bar button ```Settings``` allows users to update three default tip percentage and display __Author, Copyright data & Version)__

### Application Behavior Diagrams:

#### 1) Main Activity

<a href="pic/application_behavior_main.png"><img src="pic/application_behavior_main.png" align="center" height="850" width="800" ></a>  

__Note__: Icons for the all menu and edit items are from Google’s Material Design icon set (https://material.io/icons/)

> 1. Manually setting the location - Enter City, State (E.g.: Chicago, IL; Las Vegas, NV) or Zip Code (E.g.: 94027, 33480, 60043)

<p float="center">
 <img src="pic/dialog.png" height="600" width="300" />
 <img src="pic/atherton_dialog.png" height="600" width="300" />
 <img src="pic/Atherton.png" height="600" width="330" />
</p>

> 2. Opening the info page:

<a href="pic/info.png">
<div align="center"><img src="pic/info.png" height="750" width="400" ></div>
</a>

<br>

>> Clicking on [Google Civic Information API](https://developers.google.com/civic-information/) shall navigate the user to the API website. Clicking on developer's name shall direct the user to the Github page [Quananhle](https://github.com/Quananhle) or the all logo shall direct the user to the Github page [KnowYourGovernment](https://github.com/Quananhle/OOP-and-Android-App-Development/tree/master/Android-App-Developer/App/KnowYourGovernment) where the source code of the application is published.

<br>

> 3. Opening the view of an individual official for details:

![Alt text](pic/official_activity_1.png?raw=true "official_activity_page1")

![Alt text](pic/official_activity_2.png?raw=true "official_activity_page2")

<p float="center">
 <img src="pic/official_details.png" height="750" width="400" />
 <img src="pic/official_details_1.png" height="750" width="400" />
</p>

>> Landscape view:

<a href="pic/official_details_2.png">
<div align="center"><img src="pic/official_details_2.png" height="500" width="1100" ></div>
</a>

<br>

> 6. Maximizing the view of the photo:

![Alt text](pic/photo_activity_1.png?raw=true "photo_activity_page1")

<a href="pic/photo_details.png">
<div align="center"><img src="pic/photo_details.png" height="750" width="400" ></div>
</a>

>> Landscape view:

<a href="pic/photo_details_1.png">
<div align="center"><img src="pic/photo_details_1.png" height="500" width="1100" ></div>
</a>

<br>

> 7. Exceptions: broken images, no Internet connection:

![Alt text](pic/photo_activity_2.png?raw=true "broken")

<a href="pic/broken_image.png">
<div align="center"><img src="pic/broken_image.png" height="750" width="400" ></div>
</a>

#### 2) Settings Activity

