![MacDown logo](./Documentation/MoofFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*
<br><br>
This is a compilation of some of commonly used codes over my years of objective-C coding.<br>

Note that almost all of my other frameworks link against this library full of very convenient methods.

Other public framework : 
[**MFCocoaExtras**](https://gitlab.com/MooseFactorySoftware/MFCocoaExtras)

Many others frameworks are about to get public, so stay tuned!

Cheers :)

Tristan Leblanc - **MooseFactory Software**<br>
<https://www.moosefactory.eu>

***
### Version 1.0.3

**Updated 05/06/2016**

- <font color='#FC2132'>MFCGGraphics has been moved out. It is now part of the MFCocoaExtras Framework</font>

- Documentation Update - Separate pages per files

- Still a work in progress, but it gets better and better



-----

## <font color='#1E72AD'>Table of Content</font>

***

### <font color='#FC2132'>MFExtras</font>

**A collection of categories on basic NSFoundation classes.**<br>

##### [NSArray+MFExtras](./Documentation/NSArray+MFExtras.md)
- arrayByRemovingLastObject
- arrayByRemovingFirstObject
- alphabeticallySortedArray

##### [NSData+MFExtras](./Documentation/NSData+MFExtras.md)
- dataWithBytesString:
- bytesString
- randomDataOfLength:

##### [NSDate+MFExtras](./Documentation/NSDate+MFExtras.md)
- dateByClearingTime
- dateBySettingHour:
- isSameDayAsDate:
- isSameMonthAsDate:
- oneMonthLater
- oneMonthEarlier
- oneDayLater
- oneDayEarlier
- secondsSinceStartOfDay
- components

##### [NSDictionary+MFExtras](./Documentation/NSDictionary+MFExtras.md)
- dictionaryWithName:
- dictionaryWithName:
- localizedDictionaryWithName:
- localizedDictionaryWithName:
- alphabeticallySortedKeys

##### [NSFileManager+MFExtras](./Documentation/NSFileManager+MFExtras.md)
- isDirectoryEmpty:

##### [NSString+MFExtras](./Documentation/NSString+MFExtras.md)
- UUIDString
- md5
- sha1
- isValidEmail:
- isValidName
- urlEncode
- urlDecode

***

### <font color='#FC2132'>Date and Formatters</font>

##### [MFChronoTimeFormatter](./Documentation/MFChronoTimeFormatter.md)
##### [MFDateUtils](./Documentation/MFDateUtils.md)
##### [MFFormatters](./Documentation/MFFormatters.md)
##### [MFLatLongFormatter](./Documentation/MFLatLongFormatter.md)

***

### <font color='#FC2132'>Types</font>

##### [MFTypes](./Documentation/MFTypes.md)
##### [MFDateRange](./Documentation/MFDateRange.md)
##### [MFPeriod](./Documentation/MFPeriod.md)

***

### <font color='#FC2132'>Maths</font>

##### [MFFastTrigo](./Documentation/MFFastTrigo.md)
##### [MFMathUtilities](./Documentation/MFMathUtilities.md)

***

### <font color='#FC2132'>System</font>

##### [MFSystem](./Documentation/MFSystem.md)

***

## <font color='#1E72AD'>Installation</font>

MoofFoundation is available through CocoaPods. To install it, simply add the following line to your Podfile:

pod 'MoofFoundation'

## <font color='#1E72AD'>Author</font>

Tristan Leblanc <tristan@moosefactory.eu>

Twitter     :	<https://www.twitter.com/tristanleblanc>  
Google+     :	<https://plus.google.com/+TristanLeblanc>  

Link for recruiters ( Online Resume ) : <http://tristan.moosefactory.eu>

***

## <font color='#1E72AD'>Contribute</font>

If you wish to contribute, check the [CONTRIBUTE](CONTRIBUTE.md) file for more information.

***

## <font color='#1E72AD'>License</font>

MoofFoundation is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

***

*Preliminary document - Updated 13/03/2016 - 04/06/2016*
