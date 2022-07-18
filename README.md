# Office Hours
A novel NFT collection by 0xBasset


## Data Structures

### Characters Ids and Schedules
```
1  -> Farmer              - Monday to Friday 4am to 3pm
2  -> NFT Influencer      - Monday to Sunday 3pm to 6pm
3  -> VC Chad             - Monday to Friday 8am to 10pm
4  -> Floorboi            - Monday to Sunday 9am to 9pm
5  -> Moonboi             - Monday to Sunday 4pm to 6am
6  -> Bartender           - Thursday to Sunday 6pm to 2am
7  -> Chef                - Thursday to Sunday 5pm to 12am
8  -> Accountant          - Monday to Friday 9am to 5pm
9  -> Construction Worker - Monday to Friday 6am to 2pm
10 -> Pharmacist          - Monday to Saturday 10am to 7pm 
11 -> Lawyer              - Monday, Wednesdays, Thursdays & Friday 7am to 4pm
12 -> Athlete             - Wednesdays and Sundays 4pm to 10pm
13 -> Actress             - Tuesdays, Thursdays, Saturday and Sunday 10am to 5pm
14 -> Fashion Designer    - Mondays, Wednesdays, Fridays 9am to 11pm
15 -> Doctor              - Monday, Wednesdays, Fridays 7am to 12am
16 -> Judge               - Tuesdays to Fridays 11am to 4pm
17 -> Rugpuller           - Monday to Sunday 1am to 4am 
18 -> Ninja               - Wednesdays and Sundays from 12am to 6am
19 -> Congo Warlord       - Monday to Sunday 6pm to 8pm
20 -> Mech Santa          - Christmas
21 -> Hedgehog            - Hedgehog day
22 -> Uncle Sam           - 4th of July
23 -> Jack-o-Lantern      - Halloween 
```
### Timezones



#### Weekday id
Weekdays follow the according map:
0 -> Monday
1 -> Tuesday  
2 -> Wednesday
3 -> Thursday
4 -> Friday
5 -> Saturday
6 -> Sunday

#### Weekday encoding
To fit the weekdays that each nft works on into a single `uint8` storage, we use the bit to indicate weather or not that day is a working day.

A uint8 is composed by 8 bits and the first bit from right to left on is for Monday, then the second bit is for Tuesday and so forth. The last bit is ignored.

Examples:

```
00000001 -> Works only on Monday       | "1" in decimal 
00000010 -> Works only on Tuesday      | "2" in decimal
00000011 -> Works Mondays and Tuesday  | "3" in decimal

```
With this, we can pretty much all possible workweek combinations without any problem. In the contracts, the workweek is saved as a decimal number, instead of binary.
