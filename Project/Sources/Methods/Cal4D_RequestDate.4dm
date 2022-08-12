//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_RequestDate
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_RequestDate (message{; default date{; OK button{; Cancel button}}}) --> Date
	
	// Displays a dialog so the user can enter a date.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : The message to display
	//   $2 : Date : The default date value (optional)
	//   $3 : Text : OK button label (optional)
	//   $4 : Text : Cancel button label (optional)
	
	// Returns:
	//   $0 : Date : The entered date
	
	// Created by Dave Batton on Jul 29, 2004
	// ----------------------------------------------------
	
	//Declarations
	
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:24`Method: Cal4D_RequestDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $0; $2; vDate_D)
	C_LONGINT:C283($_l_WindowRef; Cal4d_l_OKFlag)
	C_TEXT:C284($_t_oldMethodName; $1; $3; $4; Cal4D_t_CancelButtonLabel; Cal4D_t_Message; Cal4D_t_OKButtonLabel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_RequestDate")

Cal4D_t_Message:=$1

Cal4D_t_OKButtonLabel:="OK"
Cal4D_t_CancelButtonLabel:="Cancel"
$_d_Date:=Current date:C33

If (Count parameters:C259>=3)
	$_d_Date:=$2
	If (Count parameters:C259>=3)
		Cal4D_t_OKButtonLabel:=$3
		Cal4d_l_OKFlag:=3  //added by robert molina 3/9/2007 sets flag to change ok button text.  The flag will be used in the form method Cal4D_RequestDate
		If (Count parameters:C259>=4)
			Cal4D_t_CancelButtonLabel:=$4
			Cal4d_l_OKFlag:=4  //added by robert molina 3/9/2007 sets flag to change cancel button text.  The flag will be used in the form method Cal4D_RequestDate
		End if 
	End if 
End if 

//// Modified by: Charles Vass (03/22/2009, 18:24)
////
//Cal4D_l_Day:=Day of($_d_Date)
//Cal4D_l_Month:=Month of($_d_Date)
//Cal4D_l_Year:=Year of($_d_Date)

vDate_D:=$_d_Date

$_l_WindowRef:=Cal4D_CenterWindow("Cal4D_Test_d")
DIALOG:C40("Cal4D_Test_d")
CLOSE WINDOW:C154($_l_WindowRef)

//// Modified by: Charles Vass (03/22/2009, 18:24)
////
$0:=vDate_D  //Cal4D_YearMonthDayToDate (Cal4D_l_Year;Cal4D_l_Month;Cal4D_l_Day)
ERR_MethodTrackerReturn("Cal4D_RequestDate"; $_t_oldMethodName)