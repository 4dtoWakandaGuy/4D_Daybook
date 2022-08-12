//%attributes = {}
If (False:C215)
	//Project Method Name:      Start ProcOther
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
	C_DATE:C307(vDelDate)
	C_LONGINT:C283(iInv; vCalActions; vMod; vSave)
	C_REAL:C285(vAmount; vDue; vPrice; vQuantity)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; vCalPeriod; vInvNo; vNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start ProcOther")
vCalActions:=0
vCalPeriod:=""
vDelDate:=!00-00-00!
vPrice:=0
vQuantity:=0
vAmount:=0
vNumber:=""
vInvNo:=""
vMod:=0
//vDueT:=""
vDue:=0
vSave:=0
iInv:=0
Acc_t_AccountCodeFrom:=""
Acc_t_AccountCodeTo:=""
ERR_MethodTrackerReturn("Start ProcOther"; $_t_oldMethodName)