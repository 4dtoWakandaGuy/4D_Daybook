//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont_SelPifs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; vForename; vSurname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelPifs")
//Cont_SelPifs
If (Count parameters:C259=0)
	Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Forename:4; vForename)
	Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Surname:5; vSurname)
Else 
	Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Forename:4; $1)
	If ($2="") & ($1#"")
		If (Records in selection:C76([CONTACTS:1])=0)
			
			Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Surname:5; $1)
		End if 
	Else 
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Surname:5; $2)
	End if 
	
	If (Count parameters:C259>=3)
		If ($3#"")
			Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Title:3; $3)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Cont_SelPifs"; $_t_oldMethodName)