![logo](https://github.com/DanisFabric/DateSuger/blob/master/images/logo.png)

# DateSuger

DateSuger 是一个优化Cocoa时间、日期使用方式的组件。Cocoa的 NSDate、NSDateComponent，NSCalendar等类提供了极其强大的日期处理的功能，但是使用起来却十分繁琐。DateSuger就是基于Swift2.0语言的对日期处理逻辑的一系列的语法糖。

## 要求

* iOS8 +
* Swift 2.0 +

## 安装

### Cocoapods

`pod 'DateSuger' `

### 手动

直接将Source目录下的swift文件导入到工程。

## 使用

### 日期编辑

我们想获得当前时间十天后的NSDate对象，在Cocoa中是这么做的：

```
let date1 = NSDate()
let components = NSDateComponents()
components.day = 10
let calenar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
let date2 = calenar?.dateByAddingComponents(components, toDate: date1, options: [])
```

在DateSuger里面一句话就可以代替：

```
let date3 = NSDate().dateByAddingDays(10)
```

还想更简单吗？还能这样：

```
let date4 = NSDate() + .Day(10)
```

这样相比于传统的Cocoa的接口，更加易用和容易理解。计算1年零3个月之后：

```
let date5 = NSDate() + .Year(1) + .Month(3)
```
就是这么简单~

### 日期信息

如果我们要知道今天是几月，或是星期几，传统代码如下：

```
let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
let components = calendar?.components([.Weekday,.Month], fromDate: NSDate())
let weekday = components?.weekday
let month = components?.month
```
通过DateSuger可以直接从NSDate实例中获取:

```
let weekday = NSDate().weekday
```

支持的日期信息有：

```
Era
Year
Month
Day
Hour
Minute
Second
Quarter
Weekday
WeekdayOridinal
WeekOfMonth
WeekOfYear
DayOfYear
```

### 其他信息判断

DateSuger支持对一些常用信息的判断，通过实例代码展示：

```
let v1 = NSDate().isInLeapYear 			// 判断是否是闰年
let v2 = NSDate().isToday				// 判断是否是今天
let v3 = NSDate().isTomorrow			// 判断是否是明天
let v4 = NSDate().isYesterday			// 判断是否是昨天
let v5 = NSDate().isSameDay(someDate)	// 判断是否和某日期在同一天
```
### 快速创建NSDate

能够通过指定年月日、小时、分钟、秒来创建NSDate

```
let date1 = NSDate.dateWithYear(2015, month: 3, day: 
let date2 = NSDate.dateWithYear(2015, month: 3, day: 28, hour: 3, minute: 12, second: 12)
```

### 日期比较

能够直接通过操作符来比较NSDate，这样是不是方便了很多

```
if date1 > date2 {
	//...
}
if date1 >= date2 {
	//...
}
if date1 == date2 {
	//...
}
```

### License

The MIT License (MIT)

Copyright (c) 2015 DanisFabric

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.