//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_DateToOrdinal
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	//// Cal4D_Cal_DateToOrdinal
	////
	////  Written by Charles Vass - 11/11/2008, 17:42
	////
	////  Purpose: Convert a Gregorian date to an Ordinal Date
	////
	////  $0 - LONGINT - Returned Ordinal Date
	////  $1 - DATE - Gregorian date to be converted
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 15:33`Method: Cal4D_Cal_DateToOrdinal
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Days; $_l_IsALeapYear; $_l_Month; $_l_Year; $0)
	C_TEXT:C284($_t_CurrentMethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_DateToOrdinal")

If ($1=!00-00-00!)
	$0:=-1
	
Else 
	$_l_Month:=Month of:C24($1)
	$_l_Year:=Year of:C25($1)*1000
	
	//========================    Method Actions    ==================================
	$_l_IsALeapYear:=Num:C11(SD_YearisLeapYear($1))
	
	Case of 
		: ($_l_Month=1)  //31
			$_l_Days:=0
			
		: ($_l_Month=2)  //28 or 29
			$_l_Days:=31
			
		: ($_l_Month=3)  //31
			$_l_Days:=59+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=4)  //30
			$_l_Days:=90+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=5)  //31
			$_l_Days:=120+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=6)  //30
			$_l_Days:=151+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=7)  //31
			$_l_Days:=181+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=8)  //31
			$_l_Days:=212+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=9)  //30
			$_l_Days:=243+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=10)  //31
			$_l_Days:=273+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=11)  //30
			$_l_Days:=304+Num:C11($_l_IsALeapYear)
			
		: ($_l_Month=12)  //31
			$_l_Days:=334+Num:C11($_l_IsALeapYear)
			
	End case 
	
	$_l_Days:=$_l_Days+Day of:C23($1)
	
	
	$0:=$_l_Year+$_l_Days
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_DateToOrdinal"; $_t_oldMethodName)