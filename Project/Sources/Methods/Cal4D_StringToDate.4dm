//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_StringToDate
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_StringToDate (date string) --> Date
	
	// Returns the date equivalent of the string passed.
	// Called from Cal4D_DateFilter.
	
	// This works for MM/DD/YY & DD/MM/YY forms
	// Two digit years are resolved as per the SET DEFAULT CENTURY command
	
	// Dates can be enter with any character as a delimiter
	// If no year is entered, the current year is assumed.
	// If only a one or two digit number is entered, the current month is assumed
	
	// If no delimiter is used, the following formats are supported:
	// 070476 Returns a date of 07/04/76
	// 07041976 Returns a date of 07/04/1976
	// 0704 Returns 07/04/00 (If this is in fact the year 2000)
	// 07 or 7 Returns the 7th day of the current month
	// 74, 704 and 074 are not supported.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : A date-like string
	
	// Returns:
	//   $0 : Date : The best guess at the date represented
	
	// Created by Tom Dillon, DataCraft
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:24`Method: Cal4D_StringToDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Done; $_bo_USDates)
	C_DATE:C307($_d_Date; $_d_DateToday; $0)
	C_LONGINT:C283($_l_DateStrIndex; $_l_DateStrLen; $_l_Slash1; $_l_Slash2)
	C_TEXT:C284($_t_DateStr; $_t_DateStr2; $_t_DateSubStr1; $_t_DateSubStr2; $_t_DateSubStr3; $_t_oldMethodName; $_t_ThisMonthStr; $_t_ThisYearStr; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_StringToDate")


$_t_DateStr:=$1

$_d_DateToday:=Current date:C33
$_t_ThisYearStr:=String:C10(Year of:C25($_d_DateToday); "0000")
$_t_ThisMonthStr:=String:C10(Month of:C24($_d_DateToday))

$_bo_USDates:=Day of:C23(Date:C102("1/2/2000"))=2  // US-M/D/Y, Not US-D/M/Y, Others not supported

For ($_l_DateStrIndex; 1; Length:C16($_t_DateStr))
	If (($_t_DateStr[[$_l_DateStrIndex]]<"0") | ($_t_DateStr[[$_l_DateStrIndex]]>"9"))  // if it's not 0-9, it must be a delimiter
		$_t_DateStr[[$_l_DateStrIndex]]:="/"
	End if 
End for 

Repeat 
	$_t_DateStr2:=$_t_DateStr
	$_t_DateStr:=Replace string:C233($_t_DateStr2; "//"; "/")  // Since we replaced everthing but numbers with "/", better check for dups
	$_bo_Done:=$_t_DateStr=$_t_DateStr2  // If no changes, then we're done
Until ($_bo_Done)

$_l_DateStrLen:=Length:C16($_t_DateStr)
If ($_t_DateStr[[1]]="/")  // If the first character is a slash, drop it
	$_t_DateStr:=Substring:C12($_t_DateStr; 2)
	$_l_DateStrLen:=$_l_DateStrLen-1
End if 

If ($_t_DateStr[[$_l_DateStrLen]]="/")  // If the last character is a slash, drop it
	$_t_DateStr:=Substring:C12($_t_DateStr; 1; $_l_DateStrLen-1)
	$_l_DateStrLen:=$_l_DateStrLen-1
End if 

$_l_Slash1:=Position:C15("/"; $_t_DateStr)
If (($_l_Slash1>0) & ($_l_Slash1<$_l_DateStrLen))
	$_l_Slash2:=Position:C15("/"; Substring:C12($_t_DateStr; $_l_Slash1+1))
	If ($_l_Slash2>0)
		$_l_Slash2:=$_l_Slash2+$_l_Slash1
	End if 
Else 
	$_l_Slash2:=0
End if   // ($Slash1>0)

$_t_DateSubStr1:="00"
$_t_DateSubStr2:="00"
$_t_DateSubStr3:="00"

Case of 
	: ($_t_DateStr="")  // Skip the rest if the string is blank
		
	: ($_l_Slash2>0)  // There are two slashes
		$_t_DateSubStr1:=Substring:C12($_t_DateStr; 1; $_l_Slash1-1)
		$_t_DateSubStr2:=Substring:C12($_t_DateStr; $_l_Slash1+1; $_l_Slash2-$_l_Slash1-1)
		$_t_DateSubStr3:=Substring:C12($_t_DateStr; $_l_Slash2+1)
		
	: ($_l_Slash1>0)  // Only one slash
		$_t_DateSubStr1:=Substring:C12($_t_DateStr; 1; $_l_Slash1-1)
		$_t_DateSubStr2:=Substring:C12($_t_DateStr; $_l_Slash1+1)
		$_t_DateSubStr3:=$_t_ThisYearStr  // Assume current year
		
		// No slashes (there are still some possibilities)
	: ($_l_DateStrLen<=2)  // Just the day was entered (1-2 characters)
		If ($_bo_USDates)
			$_t_DateSubStr1:=$_t_ThisMonthStr
			$_t_DateSubStr2:=$_t_DateStr
		Else 
			$_t_DateSubStr1:=$_t_DateStr
			$_t_DateSubStr2:=$_t_ThisMonthStr
		End if 
		$_t_DateSubStr3:=$_t_ThisYearStr  // Assume current year
		
	: ($_l_DateStrLen=4)  // Month and day were entered (4 characters, 3 is too tough)
		$_t_DateSubStr1:=Substring:C12($_t_DateStr; 1; 2)
		$_t_DateSubStr2:=Substring:C12($_t_DateStr; 3; 2)
		$_t_DateSubStr3:=$_t_ThisYearStr  // Assume current year
		
	: ($_l_DateStrLen>=6)  // Month and day were entered (6 or more characters)
		$_t_DateSubStr1:=Substring:C12($_t_DateStr; 1; 2)
		$_t_DateSubStr2:=Substring:C12($_t_DateStr; 3; 2)
		$_t_DateSubStr3:=Substring:C12($_t_DateStr; 5)
		
End case 

$_d_Date:=Date:C102($_t_DateSubStr1+"/"+$_t_DateSubStr2+"/"+$_t_DateSubStr3)+0  // Add zero since the Date function can return an invalid date

$0:=$_d_Date
ERR_MethodTrackerReturn("Cal4D_StringToDate"; $_t_oldMethodName)