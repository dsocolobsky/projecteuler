-- How many Sundays fell on the first of the month (1 Jan 1901 to 31 Dec 2000)?

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Show, Enum, Bounded, Eq)
data Month = January | February | March | April | May | June | July | August | September | October | November | December deriving (Show, Enum, Bounded, Eq)
type Year = Int

data Date = Date {
                day   :: Day,
                num   :: Int,
                month :: Month,
                year  :: Year
            } deriving (Show)

leapYear :: Year -> Bool
leapYear year = (year `mod` 4 == 0) && (not (year `mod` 100 == 0) || (year `mod` 100 == 0 && year `mod` 400 == 0))

daysInMonth :: Month -> Year -> Int
daysInMonth January   _ = 31
daysInMonth February year
    | leapYear year = 29
    | otherwise     = 28
daysInMonth March     _ = 31
daysInMonth April     _ = 30
daysInMonth May       _ = 31
daysInMonth June      _ = 30
daysInMonth July      _ = 31
daysInMonth August    _ = 31
daysInMonth September _ = 30
daysInMonth October   _ = 31
daysInMonth November  _ = 30
daysInMonth December  _ = 31            

allValues :: (Bounded a, Enum a) => [a]
allValues = [minBound..]

allDays :: [Day]
allDays = allValues

allMonths :: [Month]
allMonths = allValues

nextDay :: Day -> Day
nextDay day = (cycle allDays) !! (fromEnum day + 1)

nextMonth :: Month -> Month
nextMonth month = (cycle allMonths) !! (fromEnum month + 1)

nextNum :: Int -> Month -> Year -> Int
nextNum n m y
    | n == (daysInMonth m y) = 1
    | otherwise            = n+1

sundayFirst :: Date -> Bool
sundayFirst (Date Sunday 1 _ _) = True
sundayFirst (Date _ _ _ _)      = False

nextDate :: Date -> Date
nextDate (Date d n m y) = Date (nextDay d) (nextNum n m y) (nextMonth m) (y+1)

calcSundaysAux :: Date -> Int -> Int
calcSundaysAux (Date _ 31 January 1901) seen = seen
calcSundaysAux current seen = calcSundaysAux (nextDate current) (seen + (didsee)) where
    didsee = fromEnum $ sundayFirst (current)

calcSundays :: Int
calcSundays = calcSundaysAux (Date Monday 1 January 1901) 0