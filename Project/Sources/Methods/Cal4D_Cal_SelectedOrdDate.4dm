//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SelectedOrdDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/01/2010 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; Cal_l_SelectedDate)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SelectedOrdDate")

If (Count parameters:C259>=1)
	
	
	If (($1#-1) | ($1<=0))
		Cal_l_SelectedDate:=-1
	End if 
	
	If ($1>0)
		Cal4D_Cal_SelectedDate(SD_ORDINtoDate($1))
	End if 
	
	
End if 

$0:=Cal4D_Cal_DateToOrdinal(Cal4D_Cal_SelectedDate)
ERR_MethodTrackerReturn("Cal4D_Cal_SelectedOrdDate"; $_t_oldMethodName)