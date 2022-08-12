//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal_ISODayNo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 11:16`Method: Cal_ISODayNo
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($_l_Daynumber)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal_ISODayNo")
$0:=0
If (Count parameters:C259>=1)
	If ($1#!00-00-00!)
		$_d_Date:=$1
		//Note that this returns 0 for monday and 6 for sunday
		$_l_Daynumber:=Day number:C114($_d_Date)-2
		If ($_l_Daynumber<0)
			$_l_Daynumber:=CAL_ISODayConstant(Sunday:K10:19)
		End if 
		
		$0:=$_l_Daynumber
	End if 
End if 
ERR_MethodTrackerReturn("Cal_ISODayNo"; $_t_oldMethodName)