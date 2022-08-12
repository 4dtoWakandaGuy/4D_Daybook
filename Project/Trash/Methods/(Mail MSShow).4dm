//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail MSShow
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

$_t_oldMethodName:=ERR_MethodTracker("Mail MSShow")
ALL RECORDS:C47([MAILSORT_MAIL:83])
Mail_MSSort
Mail_MSStart
FORM SET OUTPUT:C54([MAILSORT_MAIL:83]; "Out Co")
vNo:=Records in selection:C76([MAILSORT_MAIL:83])
FS_SetFormSort("Out Co")
WIn_SetFormSize(1; ->[MAILSORT_MAIL:83]; "Out Co")
MODIFY SELECTION:C204([MAILSORT_MAIL:83]; *)
ERR_MethodTrackerReturn("Mail MSShow"; $_t_oldMethodName)