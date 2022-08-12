//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_DDMMYYSl
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
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Dayof; $_l_Monthof)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_DDMMYYSl")
$0:=""
$_l_Dayof:=Day of:C23($1)
If ($_l_Dayof<10)
	$0:="0"+String:C10($_l_Dayof)
Else 
	$0:=String:C10($_l_Dayof)
End if 
$_l_Monthof:=Month of:C24($1)
If ($_l_Monthof<10)
	$0:=$0+"/"+"0"+String:C10($_l_Monthof)
Else 
	$0:=$0+"/"+String:C10($_l_Monthof)
End if 
$0:=$0+"/"+Substring:C12(String:C10(Year of:C25($1)); 3; 2)
ERR_MethodTrackerReturn("Date_DDMMYYSl"; $_t_oldMethodName)