//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_FromNums
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0)
	C_LONGINT:C283(<>SYS_l_DateFormatPreference; $1; $2; $3)
	C_TEXT:C284($_t_Divider; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_FromNums")

$_t_Divider:=Date_Divider
Case of 
	: (<>SYS_l_DateFormatPreference=2)
		$0:=Date:C102(String:C10($2)+$_t_Divider+String:C10($1)+$_t_Divider+String:C10($3))
	: (<>SYS_l_DateFormatPreference=3)
		$0:=Date:C102(String:C10($3)+$_t_Divider+String:C10($2)+$_t_Divider+String:C10($1))
	: (<>SYS_l_DateFormatPreference=4)
		$0:=Date:C102(String:C10($3)+$_t_Divider+String:C10($1)+$_t_Divider+String:C10($2))
	Else 
		$0:=Date:C102(String:C10($1)+$_t_Divider+String:C10($2)+$_t_Divider+String:C10($3))
End case 
ERR_MethodTrackerReturn("Date_FromNums"; $_t_oldMethodName)