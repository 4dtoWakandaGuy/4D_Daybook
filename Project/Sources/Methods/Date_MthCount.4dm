//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_MthCount
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
	C_DATE:C307($1; $2)
	C_LONGINT:C283($_l_Month1; $_l_Month2; $_l_Year1; $_l_Year2; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_MthCount")
//Date_MthCount - counts the number of months between dates 1 & 2

$_l_Year1:=Year of:C25($1)
$_l_Year2:=Year of:C25($2)
$_l_Month1:=Month of:C24($1)
$_l_Month2:=Month of:C24($2)

If ($2>$1)
	$0:=(($_l_Year2-$_l_Year1)*12)+($_l_Month2-$_l_Month1)
Else 
	$0:=(($_l_Year1-$_l_Year2)*12)+($_l_Month1-$_l_Month2)
End if 
ERR_MethodTrackerReturn("Date_MthCount"; $_t_oldMethodName)