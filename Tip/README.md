## Tip Calculator App

##### Published Date: 12/19/2020

<p float="left">
<a href="Pictures/Hnet-image.gif"><img src="Pictures/Hnet-image.gif" align="center" height="800" width="400"></a>
<kbd><a href="Pictures/main_page.png"><img src="Pictures/main_page.png" height="800" width="350" ></a></kbd>
</p>

__Note__: App icon is from [icons8.com](https://icons8.com/icons/set/calculator)

### Application Flow Diagrams
 
* This app will calculate the tip amount from a bill amount based on the tip percentage chosen by the users.

* There are two main functions: ```Together``` to calculate the tip amount of the entire bill amount (scenario when a bill is paid in full by one person), and ```Separate``` to calculate tip amount from each person paying separately in a party and display the total tip amount, total paid.

* The left bar button ```Clear``` will reset all input and value to original

* The right bar button ```Settings``` allows users to update three default tip percentage and display __Author, Copyright data & Version)__

### Application Behavior Diagrams:

#### 1) Main Activity

<p float="center">
<kbd><a href="Pictures/main_page_1.png"><img src="Pictures/main_page_1.png" height="750" width="350"></a></kbd>
<kbd><a href="Pictures/main_page_2.png"><img src="Pictures/main_page_2.png" height="750" width="350"></a></kbd>
</p>

> 1. Enter bill amount
> 2. Select between ```Together``` or ```Separate```
>> If ```Together``` is selected:
>>> The party size is kept greying out and takes no input from the user. Tip percentages can be chosen from 3 given options: ```15%, 18%, 20%``` or customized by sliding the slider from 0% up to 100% of the total bill amount.

>> If ```Separate``` is selected:
>>> The party size now takes input from the user. Bill amount is now divided evenly between all member of the party. Tip amount is calculated separately based on the separated bill amount and tip percentages decided by each member. 

>>> ```PAID``` and ```UNDO``` buttons, and ```Split Bill```, ```Remaining```, and ```Total Tip``` fields appear after party size is entered by the user. 

>>> ```PAID``` button is disabled after the total amount is paid in full. Once ```PAID``` button is pressed, the field is greyed out again and no changes of party size can be made, unless the process is started all over. ```UNDO``` button is disabled if ```PAID``` button has not been touched before, or when no payment has been made.

* ```PAID``` button: subtracting the amount from the total bill amount after a member's payment
* ```UNDO``` button: going back to previous amount after ```PAID``` button was pressed in case of tip percentage modification
* ```Split Bill``` field: displaying the amount supposedly paid by each member in the party with tip amount included
* ```Remaining``` field: displaying the remaining amount after each payment is paid
* ```Total Tip``` fied: showing the total tip amount received from the party

![Alt text](Pictures/application_details.png?raw=true "behavior_details")

#### 2) Settings Activity

<kbd><a href="Pictures/settings_page.png"><img src="Pictures/settings_page.png" height="750" width="350"></a></kbd>
