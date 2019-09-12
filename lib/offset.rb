#mday ⇒ Object
#Returns the day of the month (1-31).

#mon ⇒ Object
#Returns the month (1-12).

#year ⇒ Integer
#Returns the year.

#pry(Enigma)> Date.today
#=> #<Date: 2019-09-12 ((2458739j,0s,0n),+0s,2299161j)>
#[2] pry(Enigma)> shift = Date.today
#=> #<Date: 2019-09-12 ((2458739j,0s,0n),+0s,2299161j)>
#[3] pry(Enigma)> shift.mday
#=> 12
#[4] pry(Enigma)> shift.mon
#=> 9
#[5] pry(Enigma)> shift.year
#=> 2019
