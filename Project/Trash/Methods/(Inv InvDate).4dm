//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv InvDate
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
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vInvDate)
	C_LONGINT:C283($_l_InvoicePeriod)
	C_TEXT:C284($_d_Date; $_t_DateString; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv InvDate")
//Inv InvDate
While ((vInvDate=!00-00-00!) & (OK=1))
	IDLE:C311  // 03/04/03 pb
	$_t_DateString:=String:C10(<>DB_d_CurrentDate)
	vInvDate:=Date:C102(Gen_Request("Invoice Date:"; $_d_Date))
	vDate:=vInvDate
	$_l_InvoicePeriod:=Check_Period
	Check_PerClose
End while 
ERR_MethodTrackerReturn("Inv InvDate"; $_t_oldMethodName)