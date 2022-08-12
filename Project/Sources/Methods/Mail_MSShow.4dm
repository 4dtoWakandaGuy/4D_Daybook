//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_MSShow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_MSShow")
ALL RECORDS:C47([MAILSORT_MAIL:83])
Mail_MSSort
Mail_MSStart
FORM SET OUTPUT:C54([MAILSORT_MAIL:83]; "Out_CO")
vNo:=Records in selection:C76([MAILSORT_MAIL:83])
FS_SetFormSort("Out_CO")
WIn_SetFormSize(1; ->[MAILSORT_MAIL:83]; "Out_CO")
MODIFY SELECTION:C204([MAILSORT_MAIL:83]; *)
ERR_MethodTrackerReturn("Mail_MSShow"; $_t_oldMethodName)