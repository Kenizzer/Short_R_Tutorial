Final Exercise: Putting together the pieces
================
Joel Swift (KU)

------------------------------------------------------------------------

<div class="objectives">

### Exercise objectives

We have learned the basics for working with R and Rstudio. Now lets
attempt to put the pieces together. I would like for everyone to
navigate to [sports-reference](https://www.sports-reference.com/) and
select a professional sport, from here select a single player and
download a .csv file of their career stats.

#### Key Steps

- Download or copy .csv formatted career stats for a single player
- Import data into R (remember we learned how to use the read.csv()
  function)
- Tidy the data as needed, rows for years and columns for individual
  performance stats
- Generate a plot for single stat across the age of the player
  (e.g. home runs by player age)
- Generate a plot for single stat across the teams the player has played
  on

#### Bonus

- Can you figure out how to combine the plots into a single plot? We did
  not cover this but a hint is to look at the help page for ggarrange()
  a function from the ggpubr package.

</div>

------------------------------------------------------------------------

## Downloading our data

We can see we have four choices of sports, pick the one is of most
interest to you and select a single player to view their career stats.

<img src="fig/sports-reference_home.png" alt="Sports reference homepage with seperate sections for baseball, basketball, football, and hockey" width="75%" />

Select the **Share & Export** button on the website and select the **Get
table as CSV (for Excel)** option.

<img src="fig/sports-reference_JoeM.png" alt="Sports reference webpage of Joe Montana's career stats" width="75%" />

Copy this information into a new text document and save as
***Player-First-Name***\_***Player-Last-Name***.csv in the data_raw
folder we created earlier.

<img src="fig/sports-reference_data.png" alt="Sports reference data for Joe Montana in csv format" width="75%" />

<img src="fig/saving_csv.png" alt="Sports reference data for Joe Montana in csv format open in sublime text editor" width="75%" />

## Data Import and Wrangling

Lets start by loading a packages we will need (e.g. the **`tidyverse`**
package).

``` r
library(tidyverse)
```

Now we will load our player data, remember the name and format maybe a
bit different depending on the sport and player.

``` r
player_data <- read_csv("data_raw/joe_montana.csv")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:200px; overflow-x: scroll; width:100%; ">

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Year
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Age
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Tm
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Pos
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
No. 
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
G
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
GS
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
QBrec
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Cmp
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Att
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Cmp%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Yds…12
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
TD
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
TD%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Int
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Int%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
1D
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Succ%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Lng
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Y/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
AY/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Y/C
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Y/G
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Rate
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Sk
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Yds…26
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Sk%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
NY/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
ANY/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
4QC
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
GWD
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
AV
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Awards
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1979
</td>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
0-1-0
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
56.5
</td>
<td style="text-align:left;">
96
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
4.3
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0.0
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
4.2
</td>
<td style="text-align:left;">
5.0
</td>
<td style="text-align:left;">
7.4
</td>
<td style="text-align:left;">
6.0
</td>
<td style="text-align:left;">
81.1
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0.0
</td>
<td style="text-align:left;">
4.17
</td>
<td style="text-align:left;">
5.04
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1980
</td>
<td style="text-align:left;">
24
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
2-5-0
</td>
<td style="text-align:left;">
176
</td>
<td style="text-align:left;">
273
</td>
<td style="text-align:left;">
64.5
</td>
<td style="text-align:left;">
1795
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
5.5
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
3.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
71
</td>
<td style="text-align:left;">
6.6
</td>
<td style="text-align:left;">
6.2
</td>
<td style="text-align:left;">
10.2
</td>
<td style="text-align:left;">
119.7
</td>
<td style="text-align:left;">
87.8
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
100
</td>
<td style="text-align:left;">
5.2
</td>
<td style="text-align:left;">
5.89
</td>
<td style="text-align:left;">
5.52
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1981\*
</td>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
13-3-0
</td>
<td style="text-align:left;">
311
</td>
<td style="text-align:left;">
488
</td>
<td style="text-align:left;">
63.7
</td>
<td style="text-align:left;">
3565
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
3.9
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
2.5
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
78
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
7.0
</td>
<td style="text-align:left;">
11.5
</td>
<td style="text-align:left;">
222.8
</td>
<td style="text-align:left;">
88.4
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
193
</td>
<td style="text-align:left;">
5.1
</td>
<td style="text-align:left;">
6.56
</td>
<td style="text-align:left;">
6.25
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
AP MVP-2 AP OPoY-3 AP2 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1982
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
3-6-0
</td>
<td style="text-align:left;">
213
</td>
<td style="text-align:left;">
346
</td>
<td style="text-align:left;">
61.6
</td>
<td style="text-align:left;">
2613
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
4.9
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
3.2
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
55
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
7.1
</td>
<td style="text-align:left;">
12.3
</td>
<td style="text-align:left;">
290.3
</td>
<td style="text-align:left;">
88.0
</td>
<td style="text-align:left;">
20
</td>
<td style="text-align:left;">
166
</td>
<td style="text-align:left;">
5.5
</td>
<td style="text-align:left;">
6.69
</td>
<td style="text-align:left;">
6.26
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1983\*
</td>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
10-6-0
</td>
<td style="text-align:left;">
332
</td>
<td style="text-align:left;">
515
</td>
<td style="text-align:left;">
64.5
</td>
<td style="text-align:left;">
3910
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
5.0
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
2.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
77
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
11.8
</td>
<td style="text-align:left;">
244.4
</td>
<td style="text-align:left;">
94.6
</td>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
224
</td>
<td style="text-align:left;">
6.0
</td>
<td style="text-align:left;">
6.73
</td>
<td style="text-align:left;">
6.69
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
AP MVP-5 AP OPoY-5 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1984\*
</td>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
14-1-0
</td>
<td style="text-align:left;">
279
</td>
<td style="text-align:left;">
432
</td>
<td style="text-align:left;">
64.6
</td>
<td style="text-align:left;">
3630
</td>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
6.5
</td>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
2.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
80
</td>
<td style="text-align:left;">
8.4
</td>
<td style="text-align:left;">
8.7
</td>
<td style="text-align:left;">
13.0
</td>
<td style="text-align:left;">
226.9
</td>
<td style="text-align:left;">
102.9
</td>
<td style="text-align:left;">
22
</td>
<td style="text-align:left;">
138
</td>
<td style="text-align:left;">
4.8
</td>
<td style="text-align:left;">
7.69
</td>
<td style="text-align:left;">
7.93
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
AP2 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1985\*
</td>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
9-6-0
</td>
<td style="text-align:left;">
303
</td>
<td style="text-align:left;">
494
</td>
<td style="text-align:left;">
61.3
</td>
<td style="text-align:left;">
3653
</td>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
5.5
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
2.6
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
73
</td>
<td style="text-align:left;">
7.4
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
12.1
</td>
<td style="text-align:left;">
243.5
</td>
<td style="text-align:left;">
91.3
</td>
<td style="text-align:left;">
35
</td>
<td style="text-align:left;">
246
</td>
<td style="text-align:left;">
6.6
</td>
<td style="text-align:left;">
6.44
</td>
<td style="text-align:left;">
6.36
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1986
</td>
<td style="text-align:left;">
30
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
6-2-0
</td>
<td style="text-align:left;">
191
</td>
<td style="text-align:left;">
307
</td>
<td style="text-align:left;">
62.2
</td>
<td style="text-align:left;">
2236
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
2.6
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
2.9
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
48
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
6.5
</td>
<td style="text-align:left;">
11.7
</td>
<td style="text-align:left;">
279.5
</td>
<td style="text-align:left;">
80.7
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
95
</td>
<td style="text-align:left;">
3.8
</td>
<td style="text-align:left;">
6.71
</td>
<td style="text-align:left;">
5.94
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
AP MVP-6
</td>
</tr>
<tr>
<td style="text-align:left;">
1987\*+
</td>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
10-1-0
</td>
<td style="text-align:left;">
266
</td>
<td style="text-align:left;">
398
</td>
<td style="text-align:left;">
66.8
</td>
<td style="text-align:left;">
3054
</td>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
7.8
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
3.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
57
</td>
<td style="text-align:left;">
7.7
</td>
<td style="text-align:left;">
7.8
</td>
<td style="text-align:left;">
11.5
</td>
<td style="text-align:left;">
234.9
</td>
<td style="text-align:left;">
102.1
</td>
<td style="text-align:left;">
22
</td>
<td style="text-align:left;">
158
</td>
<td style="text-align:left;">
5.2
</td>
<td style="text-align:left;">
6.90
</td>
<td style="text-align:left;">
6.98
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
AP MVP-3 AP OPoY-2 AP1 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1988
</td>
<td style="text-align:left;">
32
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
8-5-0
</td>
<td style="text-align:left;">
238
</td>
<td style="text-align:left;">
397
</td>
<td style="text-align:left;">
59.9
</td>
<td style="text-align:left;">
2981
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
4.5
</td>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
2.5
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
96
</td>
<td style="text-align:left;">
7.5
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
12.5
</td>
<td style="text-align:left;">
212.9
</td>
<td style="text-align:left;">
87.9
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
223
</td>
<td style="text-align:left;">
7.9
</td>
<td style="text-align:left;">
6.40
</td>
<td style="text-align:left;">
6.19
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1989\*+
</td>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
11-2-0
</td>
<td style="text-align:left;">
271
</td>
<td style="text-align:left;">
386
</td>
<td style="text-align:left;">
70.2
</td>
<td style="text-align:left;">
3521
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
6.7
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
2.1
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
95
</td>
<td style="text-align:left;">
9.1
</td>
<td style="text-align:left;">
9.5
</td>
<td style="text-align:left;">
13.0
</td>
<td style="text-align:left;">
270.8
</td>
<td style="text-align:left;">
112.4
</td>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
198
</td>
<td style="text-align:left;">
7.9
</td>
<td style="text-align:left;">
7.93
</td>
<td style="text-align:left;">
8.31
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
AP MVP-1 AP OPoY-1 AP1 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1990\*+
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
14-1-0
</td>
<td style="text-align:left;">
321
</td>
<td style="text-align:left;">
520
</td>
<td style="text-align:left;">
61.7
</td>
<td style="text-align:left;">
3944
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
5.0
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
3.1
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
78
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
7.2
</td>
<td style="text-align:left;">
12.3
</td>
<td style="text-align:left;">
262.9
</td>
<td style="text-align:left;">
89.0
</td>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
153
</td>
<td style="text-align:left;">
5.3
</td>
<td style="text-align:left;">
6.91
</td>
<td style="text-align:left;">
6.54
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
AP MVP-1 AP OPoY-3 AP1 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1991
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
<td style="text-align:left;">
Missed season - Injured (elbow)
</td>
</tr>
<tr>
<td style="text-align:left;">
1992
</td>
<td style="text-align:left;">
36
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
21
</td>
<td style="text-align:left;">
71.4
</td>
<td style="text-align:left;">
126
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
9.5
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0.0
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
6.0
</td>
<td style="text-align:left;">
7.9
</td>
<td style="text-align:left;">
8.4
</td>
<td style="text-align:left;">
126.0
</td>
<td style="text-align:left;">
118.4
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
4.5
</td>
<td style="text-align:left;">
5.36
</td>
<td style="text-align:left;">
7.18
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1993\*
</td>
<td style="text-align:left;">
37
</td>
<td style="text-align:left;">
KAN
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
8-3-0
</td>
<td style="text-align:left;">
181
</td>
<td style="text-align:left;">
298
</td>
<td style="text-align:left;">
60.7
</td>
<td style="text-align:left;">
2144
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
4.4
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
2.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
50
</td>
<td style="text-align:left;">
7.2
</td>
<td style="text-align:left;">
7.0
</td>
<td style="text-align:left;">
11.8
</td>
<td style="text-align:left;">
194.9
</td>
<td style="text-align:left;">
87.4
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
61
</td>
<td style="text-align:left;">
3.9
</td>
<td style="text-align:left;">
6.72
</td>
<td style="text-align:left;">
6.54
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1994
</td>
<td style="text-align:left;">
38
</td>
<td style="text-align:left;">
KAN
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
9-5-0
</td>
<td style="text-align:left;">
299
</td>
<td style="text-align:left;">
493
</td>
<td style="text-align:left;">
60.6
</td>
<td style="text-align:left;">
3283
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
3.2
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
1.8
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
45.9
</td>
<td style="text-align:left;">
57
</td>
<td style="text-align:left;">
6.7
</td>
<td style="text-align:left;">
6.5
</td>
<td style="text-align:left;">
11.0
</td>
<td style="text-align:left;">
234.5
</td>
<td style="text-align:left;">
83.6
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
132
</td>
<td style="text-align:left;">
3.7
</td>
<td style="text-align:left;">
6.15
</td>
<td style="text-align:left;">
5.99
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Career
</td>
<td style="text-align:left;">
Career
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
192
</td>
<td style="text-align:left;">
164
</td>
<td style="text-align:left;">
117-47-0
</td>
<td style="text-align:left;">
3409
</td>
<td style="text-align:left;">
5391
</td>
<td style="text-align:left;">
63.2
</td>
<td style="text-align:left;">
40551
</td>
<td style="text-align:left;">
273
</td>
<td style="text-align:left;">
5.1
</td>
<td style="text-align:left;">
139
</td>
<td style="text-align:left;">
2.6
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
45.9
</td>
<td style="text-align:left;">
96
</td>
<td style="text-align:left;">
7.5
</td>
<td style="text-align:left;">
7.4
</td>
<td style="text-align:left;">
11.9
</td>
<td style="text-align:left;">
211.2
</td>
<td style="text-align:left;">
92.3
</td>
<td style="text-align:left;">
313
</td>
<td style="text-align:left;">
2095
</td>
<td style="text-align:left;">
5.5
</td>
<td style="text-align:left;">
6.74
</td>
<td style="text-align:left;">
6.60
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
166
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
13 yrs
</td>
<td style="text-align:left;">
13 yrs
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
167
</td>
<td style="text-align:left;">
139
</td>
<td style="text-align:left;">
100-39-0
</td>
<td style="text-align:left;">
2929
</td>
<td style="text-align:left;">
4600
</td>
<td style="text-align:left;">
63.7
</td>
<td style="text-align:left;">
35124
</td>
<td style="text-align:left;">
244
</td>
<td style="text-align:left;">
5.3
</td>
<td style="text-align:left;">
123
</td>
<td style="text-align:left;">
2.7
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
96
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
7.5
</td>
<td style="text-align:left;">
12.0
</td>
<td style="text-align:left;">
210.3
</td>
<td style="text-align:left;">
93.5
</td>
<td style="text-align:left;">
282
</td>
<td style="text-align:left;">
1902
</td>
<td style="text-align:left;">
5.8
</td>
<td style="text-align:left;">
6.80
</td>
<td style="text-align:left;">
6.67
</td>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
148
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
2 yrs
</td>
<td style="text-align:left;">
2 yrs
</td>
<td style="text-align:left;">
KAN
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
17-8-0
</td>
<td style="text-align:left;">
480
</td>
<td style="text-align:left;">
791
</td>
<td style="text-align:left;">
60.7
</td>
<td style="text-align:left;">
5427
</td>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
3.7
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
2.0
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
45.9
</td>
<td style="text-align:left;">
57
</td>
<td style="text-align:left;">
6.9
</td>
<td style="text-align:left;">
6.7
</td>
<td style="text-align:left;">
11.3
</td>
<td style="text-align:left;">
217.1
</td>
<td style="text-align:left;">
85.0
</td>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
193
</td>
<td style="text-align:left;">
3.8
</td>
<td style="text-align:left;">
6.37
</td>
<td style="text-align:left;">
6.20
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
NA
</td>
</tr>
</tbody>
</table>

</div>

We can see there are several issues that need to be correct for our data
frame containing stats per season for Joe Montana. Lets work through how
to fix them using what we learned about indexing data frames.

First we will remove the few rows that do not contain data we want.

- One is a season that was missed due to injury (1991).
- Three columns at the end that have career and composite stats (2 year
  and 13 year combine data).

We can easily remove the first column by checking whether ***Age*** is
**NA** and removing columns that meet this criteria.The other columns
come at the end of the data frame so we can use indexing to remove he
last three rows.

``` r
player_data$Age
```

    #>  [1] "23"     "24"     "25"     "26"     "27"     "28"     "29"     "30"    
    #>  [9] "31"     "32"     "33"     "34"     NA       "36"     "37"     "38"    
    #> [17] "Career" "13 yrs" "2 yrs"

``` r
player_data <- player_data[!is.na(player_data$Age), ]
player_data_clean <- player_data[-c(16,17,18),]
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:200px; overflow-x: scroll; width:100%; ">

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Year
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Age
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Tm
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Pos
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
No. 
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
G
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
GS
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
QBrec
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Cmp
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Att
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Cmp%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Yds…12
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
TD
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
TD%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Int
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Int%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
1D
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Succ%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Lng
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Y/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
AY/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Y/C
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Y/G
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Rate
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Sk
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Yds…26
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Sk%
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
NY/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
ANY/A
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
4QC
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
GWD
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
AV
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Awards
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1979
</td>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
0-1-0
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
56.5
</td>
<td style="text-align:left;">
96
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
4.3
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0.0
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
4.2
</td>
<td style="text-align:left;">
5.0
</td>
<td style="text-align:left;">
7.4
</td>
<td style="text-align:left;">
6.0
</td>
<td style="text-align:left;">
81.1
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0.0
</td>
<td style="text-align:left;">
4.17
</td>
<td style="text-align:left;">
5.04
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1980
</td>
<td style="text-align:left;">
24
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
2-5-0
</td>
<td style="text-align:left;">
176
</td>
<td style="text-align:left;">
273
</td>
<td style="text-align:left;">
64.5
</td>
<td style="text-align:left;">
1795
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
5.5
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
3.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
71
</td>
<td style="text-align:left;">
6.6
</td>
<td style="text-align:left;">
6.2
</td>
<td style="text-align:left;">
10.2
</td>
<td style="text-align:left;">
119.7
</td>
<td style="text-align:left;">
87.8
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
100
</td>
<td style="text-align:left;">
5.2
</td>
<td style="text-align:left;">
5.89
</td>
<td style="text-align:left;">
5.52
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1981\*
</td>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
13-3-0
</td>
<td style="text-align:left;">
311
</td>
<td style="text-align:left;">
488
</td>
<td style="text-align:left;">
63.7
</td>
<td style="text-align:left;">
3565
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
3.9
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
2.5
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
78
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
7.0
</td>
<td style="text-align:left;">
11.5
</td>
<td style="text-align:left;">
222.8
</td>
<td style="text-align:left;">
88.4
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
193
</td>
<td style="text-align:left;">
5.1
</td>
<td style="text-align:left;">
6.56
</td>
<td style="text-align:left;">
6.25
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
AP MVP-2 AP OPoY-3 AP2 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1982
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
3-6-0
</td>
<td style="text-align:left;">
213
</td>
<td style="text-align:left;">
346
</td>
<td style="text-align:left;">
61.6
</td>
<td style="text-align:left;">
2613
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
4.9
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
3.2
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
55
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
7.1
</td>
<td style="text-align:left;">
12.3
</td>
<td style="text-align:left;">
290.3
</td>
<td style="text-align:left;">
88.0
</td>
<td style="text-align:left;">
20
</td>
<td style="text-align:left;">
166
</td>
<td style="text-align:left;">
5.5
</td>
<td style="text-align:left;">
6.69
</td>
<td style="text-align:left;">
6.26
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1983\*
</td>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
10-6-0
</td>
<td style="text-align:left;">
332
</td>
<td style="text-align:left;">
515
</td>
<td style="text-align:left;">
64.5
</td>
<td style="text-align:left;">
3910
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
5.0
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
2.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
77
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
11.8
</td>
<td style="text-align:left;">
244.4
</td>
<td style="text-align:left;">
94.6
</td>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
224
</td>
<td style="text-align:left;">
6.0
</td>
<td style="text-align:left;">
6.73
</td>
<td style="text-align:left;">
6.69
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
AP MVP-5 AP OPoY-5 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1984\*
</td>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
14-1-0
</td>
<td style="text-align:left;">
279
</td>
<td style="text-align:left;">
432
</td>
<td style="text-align:left;">
64.6
</td>
<td style="text-align:left;">
3630
</td>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
6.5
</td>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
2.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
80
</td>
<td style="text-align:left;">
8.4
</td>
<td style="text-align:left;">
8.7
</td>
<td style="text-align:left;">
13.0
</td>
<td style="text-align:left;">
226.9
</td>
<td style="text-align:left;">
102.9
</td>
<td style="text-align:left;">
22
</td>
<td style="text-align:left;">
138
</td>
<td style="text-align:left;">
4.8
</td>
<td style="text-align:left;">
7.69
</td>
<td style="text-align:left;">
7.93
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
AP2 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1985\*
</td>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
9-6-0
</td>
<td style="text-align:left;">
303
</td>
<td style="text-align:left;">
494
</td>
<td style="text-align:left;">
61.3
</td>
<td style="text-align:left;">
3653
</td>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
5.5
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
2.6
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
73
</td>
<td style="text-align:left;">
7.4
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
12.1
</td>
<td style="text-align:left;">
243.5
</td>
<td style="text-align:left;">
91.3
</td>
<td style="text-align:left;">
35
</td>
<td style="text-align:left;">
246
</td>
<td style="text-align:left;">
6.6
</td>
<td style="text-align:left;">
6.44
</td>
<td style="text-align:left;">
6.36
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1986
</td>
<td style="text-align:left;">
30
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
6-2-0
</td>
<td style="text-align:left;">
191
</td>
<td style="text-align:left;">
307
</td>
<td style="text-align:left;">
62.2
</td>
<td style="text-align:left;">
2236
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
2.6
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
2.9
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
48
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
6.5
</td>
<td style="text-align:left;">
11.7
</td>
<td style="text-align:left;">
279.5
</td>
<td style="text-align:left;">
80.7
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
95
</td>
<td style="text-align:left;">
3.8
</td>
<td style="text-align:left;">
6.71
</td>
<td style="text-align:left;">
5.94
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
AP MVP-6
</td>
</tr>
<tr>
<td style="text-align:left;">
1987\*+
</td>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
10-1-0
</td>
<td style="text-align:left;">
266
</td>
<td style="text-align:left;">
398
</td>
<td style="text-align:left;">
66.8
</td>
<td style="text-align:left;">
3054
</td>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
7.8
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
3.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
57
</td>
<td style="text-align:left;">
7.7
</td>
<td style="text-align:left;">
7.8
</td>
<td style="text-align:left;">
11.5
</td>
<td style="text-align:left;">
234.9
</td>
<td style="text-align:left;">
102.1
</td>
<td style="text-align:left;">
22
</td>
<td style="text-align:left;">
158
</td>
<td style="text-align:left;">
5.2
</td>
<td style="text-align:left;">
6.90
</td>
<td style="text-align:left;">
6.98
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
AP MVP-3 AP OPoY-2 AP1 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1988
</td>
<td style="text-align:left;">
32
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
8-5-0
</td>
<td style="text-align:left;">
238
</td>
<td style="text-align:left;">
397
</td>
<td style="text-align:left;">
59.9
</td>
<td style="text-align:left;">
2981
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
4.5
</td>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
2.5
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
96
</td>
<td style="text-align:left;">
7.5
</td>
<td style="text-align:left;">
7.3
</td>
<td style="text-align:left;">
12.5
</td>
<td style="text-align:left;">
212.9
</td>
<td style="text-align:left;">
87.9
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
223
</td>
<td style="text-align:left;">
7.9
</td>
<td style="text-align:left;">
6.40
</td>
<td style="text-align:left;">
6.19
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1989\*+
</td>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
11-2-0
</td>
<td style="text-align:left;">
271
</td>
<td style="text-align:left;">
386
</td>
<td style="text-align:left;">
70.2
</td>
<td style="text-align:left;">
3521
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
6.7
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
2.1
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
95
</td>
<td style="text-align:left;">
9.1
</td>
<td style="text-align:left;">
9.5
</td>
<td style="text-align:left;">
13.0
</td>
<td style="text-align:left;">
270.8
</td>
<td style="text-align:left;">
112.4
</td>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
198
</td>
<td style="text-align:left;">
7.9
</td>
<td style="text-align:left;">
7.93
</td>
<td style="text-align:left;">
8.31
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
AP MVP-1 AP OPoY-1 AP1 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1990\*+
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
14-1-0
</td>
<td style="text-align:left;">
321
</td>
<td style="text-align:left;">
520
</td>
<td style="text-align:left;">
61.7
</td>
<td style="text-align:left;">
3944
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
5.0
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
3.1
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
78
</td>
<td style="text-align:left;">
7.6
</td>
<td style="text-align:left;">
7.2
</td>
<td style="text-align:left;">
12.3
</td>
<td style="text-align:left;">
262.9
</td>
<td style="text-align:left;">
89.0
</td>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
153
</td>
<td style="text-align:left;">
5.3
</td>
<td style="text-align:left;">
6.91
</td>
<td style="text-align:left;">
6.54
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
AP MVP-1 AP OPoY-3 AP1 PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1992
</td>
<td style="text-align:left;">
36
</td>
<td style="text-align:left;">
SFO
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
21
</td>
<td style="text-align:left;">
71.4
</td>
<td style="text-align:left;">
126
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
9.5
</td>
<td style="text-align:left;">
0
</td>
<td style="text-align:left;">
0.0
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
6.0
</td>
<td style="text-align:left;">
7.9
</td>
<td style="text-align:left;">
8.4
</td>
<td style="text-align:left;">
126.0
</td>
<td style="text-align:left;">
118.4
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
4.5
</td>
<td style="text-align:left;">
5.36
</td>
<td style="text-align:left;">
7.18
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
1993\*
</td>
<td style="text-align:left;">
37
</td>
<td style="text-align:left;">
KAN
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
8-3-0
</td>
<td style="text-align:left;">
181
</td>
<td style="text-align:left;">
298
</td>
<td style="text-align:left;">
60.7
</td>
<td style="text-align:left;">
2144
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
4.4
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
2.3
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
50
</td>
<td style="text-align:left;">
7.2
</td>
<td style="text-align:left;">
7.0
</td>
<td style="text-align:left;">
11.8
</td>
<td style="text-align:left;">
194.9
</td>
<td style="text-align:left;">
87.4
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
61
</td>
<td style="text-align:left;">
3.9
</td>
<td style="text-align:left;">
6.72
</td>
<td style="text-align:left;">
6.54
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
PB
</td>
</tr>
<tr>
<td style="text-align:left;">
1994
</td>
<td style="text-align:left;">
38
</td>
<td style="text-align:left;">
KAN
</td>
<td style="text-align:left;">
QB
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
9-5-0
</td>
<td style="text-align:left;">
299
</td>
<td style="text-align:left;">
493
</td>
<td style="text-align:left;">
60.6
</td>
<td style="text-align:left;">
3283
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
3.2
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
1.8
</td>
<td style="text-align:left;">
168
</td>
<td style="text-align:left;">
45.9
</td>
<td style="text-align:left;">
57
</td>
<td style="text-align:left;">
6.7
</td>
<td style="text-align:left;">
6.5
</td>
<td style="text-align:left;">
11.0
</td>
<td style="text-align:left;">
234.5
</td>
<td style="text-align:left;">
83.6
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
132
</td>
<td style="text-align:left;">
3.7
</td>
<td style="text-align:left;">
6.15
</td>
<td style="text-align:left;">
5.99
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
NA
</td>
</tr>
</tbody>
</table>

</div>

### Converting columns to factors/numeric

To facilitate easier plotting in ggplot, we need to convert some of the
columns in the data frame to factors. We can use **`str()`** or
**`summary()`** to view the current state of the data frame. You will
likely need to do things a bit differently depending on what
sport/player you selected. Try to work through the process of converting
the team and age to a factor and two stats to numeric.

``` r
str(player_data_clean, list.len = 12)
```

    #> tibble [15 × 33] (S3: tbl_df/tbl/data.frame)
    #>  $ Year    : chr [1:15] "1979" "1980" "1981*" "1982" ...
    #>  $ Age     : chr [1:15] "23" "24" "25" "26" ...
    #>  $ Tm      : chr [1:15] "SFO" "SFO" "SFO" "SFO" ...
    #>  $ Pos     : chr [1:15] "QB" "QB" "QB" "QB" ...
    #>  $ No.     : chr [1:15] "16" "16" "16" "16" ...
    #>  $ G       : chr [1:15] "16" "15" "16" "9" ...
    #>  $ GS      : chr [1:15] "1" "7" "16" "9" ...
    #>  $ QBrec   : chr [1:15] "0-1-0" "2-5-0" "13-3-0" "3-6-0" ...
    #>  $ Cmp     : chr [1:15] "13" "176" "311" "213" ...
    #>  $ Att     : chr [1:15] "23" "273" "488" "346" ...
    #>  $ Cmp%    : chr [1:15] "56.5" "64.5" "63.7" "61.6" ...
    #>  $ Yds...12: chr [1:15] "96" "1795" "3565" "2613" ...
    #>   [list output truncated]

``` r
# Convert team and age to factors
player_data_clean$Tm <- as.factor(player_data_clean$Tm)
player_data_clean$Age <- as.factor(player_data_clean$Age)
# Convert TD and yards to numeric
player_data_clean$TD <- as.numeric(player_data_clean$TD)
# We need to first rename the passing yards column to something more understandable
names(player_data_clean)[names(player_data_clean) == 'Yds...12'] <- 'Passing_Yds'
player_data_clean$Passing_Yds <- as.numeric(player_data_clean$Passing_Yds)
```

## Plotting

Lets start by thinking about what kind of plot might make sense for the
type of data we have. Check back to the [ggplot cheat
sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)!

### Touchdowns by team

``` r
ggplot(data = player_data_clean, aes(x = Tm, y = TD)) +
  geom_col()
```

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

#### Can we jazz it up a bit?

``` r
ggplot(data = player_data_clean, aes(x = Tm, y = TD, fill = Tm)) +
  geom_col() +
  xlab("Team") +
  ylab("Touchdowns") +
  scale_fill_manual(name = "Team", values = c("#E31837","#AA0000")) + # Team colors found on google
  theme_bw()
```

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

### Passing Yards by age

``` r
ggplot(data = player_data_clean, aes(x = Age, y = Passing_Yds)) +
  geom_col()
```

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

``` r
# And the jazzed version
ggplot(data = player_data_clean, aes(x = Age, y = Passing_Yds, fill = Tm)) +
  geom_col() +
  xlab("Age") +
  ylab("Passing Yards") +
  scale_fill_manual(name = "Team", values = c("#E31837","#AA0000")) + # Team colors found on google
  theme_bw()
```

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-12-2.png)<!-- -->

#### Extra plot, Touchdowns by Games started with a trend line

``` r
ggplot(data = player_data_clean, aes(x = as.numeric(GS), y = TD, fill = Tm)) +
  geom_point(shape = 21, size = 5) +
  xlab("Games Started") +
  ylab("Touchdowns") +
  scale_fill_manual(name = "Team", values = c("#E31837","#AA0000")) + # Team colors found on google
  theme_bw()
```

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

``` r
# Can we add a linear regression line for the relationship?
ggplot(data = player_data_clean, aes(x = as.numeric(GS), y = TD)) +
  geom_point(shape = 21, fill = "green", size = 5) +
  geom_smooth(method = lm) +
  xlab("Games Started") +
  ylab("Touchdowns") +
  theme_bw()
```

    #> `geom_smooth()` using formula = 'y ~ x'

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-13-2.png)<!-- -->

### Bonus: Combining plots together

Often in a manuscript we would like to have multiple panels to a figure
denoted by letters. We can utilize the package
[`ggpubr`](https://cran.r-project.org/web/packages/ggpubr/index.html),
note there are many other great packages for working with multiple plots
(e.g. [`patchwork`](https://cran.r-project.org/web/packages/patchwork/index.html))

We first must save our plots to objects.

``` r
plot_1 <- ggplot(data = player_data_clean, aes(x = Age, y = Passing_Yds, fill = Tm)) +
  geom_col() +
  xlab("Age") +
  ylab("Passing Yards") +
  scale_fill_manual(name = "Team", values = c("#E31837","#AA0000")) + # Team colors found on google
  theme_bw()

plot_2 <- ggplot(data = player_data_clean, aes(x = Tm, y = TD, fill = Tm)) +
  geom_col() +
  xlab("Team") +
  ylab("Touchdowns") +
  scale_fill_manual(name = "Team", values = c("#E31837","#AA0000")) + # Team colors found on google
  theme_bw()
```

Next we need to load the **`ggpubr`** package and use the
**`ggarrange()`** function. Try to utilize the help page for
**`ggarrange()`** to figure out what options to include.

``` r
library(ggpubr)

# Basic example
ggarrange(plot_1, plot_2)
```

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

##### Can you get to this plot using **`ggarrange()`** options?

![](05-Final-exercise_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->
