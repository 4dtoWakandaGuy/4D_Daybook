//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_SecPInv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_SecPInv")

If ((([PURCHASE_INVOICES:37]State:24>0) | (([PURCHASE_INVOICES:37]State:24<-1) & ([PURCHASE_INVOICES:37]Posted_Date:12#!00-00-00!))) & (DB_t_CurrentFormUsage2#"NM"))  //& ($1»#Old($1»)))
	If (Menu selected:C152=0)
		Gen_Alert("You cannot modify this field"; "Cancel")
		$1->:=Old:C35($1->)
	End if 
	OK:=0
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("Check_SecPInv"; $_t_oldMethodName)