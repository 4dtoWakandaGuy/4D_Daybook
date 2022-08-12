//%attributes = {}
If (False:C215)
	//Project Method Name:      SRCH_SetHLContextualDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/07/2012 18:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ListID2Reference; $_l_ListID3Reference; $_l_ListIDReference)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SRCH_SetHLContextualDates")

$1->:=New list:C375




$_l_ListIDReference:=New list:C375
APPEND TO LIST:C376($_l_ListIDReference; "1 Day"; 1)
APPEND TO LIST:C376($_l_ListIDReference; "2 Days"; 2)
APPEND TO LIST:C376($_l_ListIDReference; "3 Days"; 3)
APPEND TO LIST:C376($_l_ListIDReference; "4 Days"; 4)
APPEND TO LIST:C376($_l_ListIDReference; "5 Days"; 5)
APPEND TO LIST:C376($_l_ListIDReference; "6 Days"; 6)
APPEND TO LIST:C376($_l_ListIDReference; "7 Days"; 7)
APPEND TO LIST:C376($_l_ListIDReference; "8 Days"; 8)
APPEND TO LIST:C376($_l_ListIDReference; "9 Days"; 9)
APPEND TO LIST:C376($_l_ListIDReference; "10 Days"; 10)
APPEND TO LIST:C376($_l_ListIDReference; "11 Days"; 11)
APPEND TO LIST:C376($_l_ListIDReference; "12 Days"; 12)
APPEND TO LIST:C376($_l_ListIDReference; "13 Days"; 13)
APPEND TO LIST:C376($_l_ListIDReference; "14 Days"; 14)
APPEND TO LIST:C376($_l_ListIDReference; "15 Days"; 15)
APPEND TO LIST:C376($_l_ListIDReference; "16 Days"; 16)
APPEND TO LIST:C376($_l_ListIDReference; "17 Days"; 17)
APPEND TO LIST:C376($_l_ListIDReference; "18 Days"; 18)
APPEND TO LIST:C376($_l_ListIDReference; "19 Days"; 19)
APPEND TO LIST:C376($_l_ListIDReference; "20 Days"; 20)
APPEND TO LIST:C376($_l_ListIDReference; "21 Days"; 21)
APPEND TO LIST:C376($_l_ListIDReference; "22 Days"; 22)
APPEND TO LIST:C376($_l_ListIDReference; "23 Days"; 23)
APPEND TO LIST:C376($_l_ListIDReference; "24 Days"; 24)
APPEND TO LIST:C376($_l_ListIDReference; "25 Days"; 25)
APPEND TO LIST:C376($_l_ListIDReference; "26 Days"; 26)
APPEND TO LIST:C376($_l_ListIDReference; "27 Days"; 27)
APPEND TO LIST:C376($_l_ListIDReference; "28 Days"; 28)
APPEND TO LIST:C376($_l_ListIDReference; "29 Days"; 29)
APPEND TO LIST:C376($_l_ListIDReference; "30 Days"; 30)
APPEND TO LIST:C376($_l_ListIDReference; "31 Days"; 31)
APPEND TO LIST:C376($_l_ListIDReference; "Other..."; 32)

$_l_ListID2Reference:=New list:C375
APPEND TO LIST:C376($_l_ListID2Reference; "1 Month"; -1)
APPEND TO LIST:C376($_l_ListID2Reference; "2 Months"; -2)
APPEND TO LIST:C376($_l_ListID2Reference; "3 Months"; -3)
APPEND TO LIST:C376($_l_ListID2Reference; "4 Months"; -4)
APPEND TO LIST:C376($_l_ListID2Reference; "5 Months"; -5)
APPEND TO LIST:C376($_l_ListID2Reference; "6 Months"; -6)
APPEND TO LIST:C376($_l_ListID2Reference; "7 Months"; -7)
APPEND TO LIST:C376($_l_ListID2Reference; "8 Months"; -8)
APPEND TO LIST:C376($_l_ListID2Reference; "9 Months"; -9)
APPEND TO LIST:C376($_l_ListID2Reference; "10 Months"; -10)
APPEND TO LIST:C376($_l_ListID2Reference; "11 Months"; -11)
APPEND TO LIST:C376($_l_ListID2Reference; "12 Months"; -12)
APPEND TO LIST:C376($_l_ListID2Reference; "Other..."; -13)

$_l_ListID3Reference:=New list:C375
APPEND TO LIST:C376($_l_ListID3Reference; "1 Year"; -100)
APPEND TO LIST:C376($_l_ListID3Reference; "2 Years"; -200)
APPEND TO LIST:C376($_l_ListID3Reference; "3 Years"; -300)
APPEND TO LIST:C376($_l_ListID3Reference; "4 Years"; -400)
APPEND TO LIST:C376($_l_ListID3Reference; "5 Years"; -500)
APPEND TO LIST:C376($_l_ListID3Reference; "6 Years"; -600)
APPEND TO LIST:C376($_l_ListID3Reference; "7 Years"; -700)
APPEND TO LIST:C376($_l_ListID3Reference; "8 Years"; -800)
APPEND TO LIST:C376($_l_ListID3Reference; "9 Years"; -900)
APPEND TO LIST:C376($_l_ListID3Reference; "10 Years"; -1000)
APPEND TO LIST:C376($_l_ListID3Reference; "11 Years"; -1100)
APPEND TO LIST:C376($_l_ListID3Reference; "12 Years"; -1200)
APPEND TO LIST:C376($_l_ListID3Reference; "Other..."; -1500)

APPEND TO LIST:C376($1->; "Days"; -9000; $_l_ListIDReference; True:C214)
APPEND TO LIST:C376($1->; "Months"; -10000; $_l_ListID2Reference; True:C214)
APPEND TO LIST:C376($1->; "Years"; -11000; $_l_ListID3Reference; True:C214)
ERR_MethodTrackerReturn("SRCH_SetHLContextualDates"; $_t_oldMethodName)
