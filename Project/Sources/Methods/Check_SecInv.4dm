//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_SecInv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/05/2010 05:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_POINTER:C301($1)
	C_TEXT:C284(<>UserAdd; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_SecInv")
//Chec SecInv
If (([INVOICES:39]State:10>0) | (([INVOICES:39]State:10<-1) & ([INVOICES:39]Posted_Date:8#!00-00-00!)))  //& ($1»#Old($1»)))
	Gen_Alert("You cannot modify this field"; "Cancel")
	$1->:=Old:C35($1->)
	OK:=0
Else 
	If ((Count parameters:C259=2) & ([INVOICES_ITEMS:161]Item_Number:12#0) & (<>UserAdd#"@USL@"))
		Gen_Alert("You cannot modify this field because it has been created from an Order Item."+Char:C90(13)+"If you need to modify it, please Cancel this Invoice and change the Order "+"instead."; "Cancel")
		$1->:=Old:C35($1->)
		OK:=0
	Else 
		OK:=1
	End if 
End if 
ERR_MethodTrackerReturn("Check_SecInv"; $_t_oldMethodName)