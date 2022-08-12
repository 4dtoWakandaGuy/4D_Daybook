//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Date FromStrs
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
	C_LONGINT:C283(<>SYS_l_DateFormatPreference; $_l_Year)
	C_TEXT:C284($_t_Divider; $_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date FromStrs")


If ($3="00")
	$3:="2000"
End if 

$_l_Year:=Year of:C25(Date:C102("01/01/"+$3))
If ($_l_Year<1960)
	$_l_Year:=$_l_Year+100
End if 






$_t_Divider:=Date_Divider
Case of 
	: (<>SYS_l_DateFormatPreference=2)
		$0:=Date:C102($2+"/"+$1+"/"+String:C10($_l_Year))
	: (<>SYS_l_DateFormatPreference=3)
		$0:=Date:C102(String:C10($_l_Year)+"/"+$2+"/"+$1)
	: (<>SYS_l_DateFormatPreference=4)
		$0:=Date:C102(String:C10($_l_Year)+"/"+$1+"/"+$2)
	Else 
		$0:=Date:C102($1+"/"+$2+"/"+String:C10($_l_Year))
End case 
ERR_MethodTrackerReturn("Date FromStrs"; $_t_oldMethodName)