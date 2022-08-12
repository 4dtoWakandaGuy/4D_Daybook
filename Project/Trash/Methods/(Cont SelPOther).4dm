//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont_SelPOther
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3; $4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelPOther")
Sel_SetAny($3; $1)

//DEFAULT TABLE([CONTACTS])
Sel_Beginning3(->[CONTACTS:1])
If (Count parameters:C259<5)
	Cont_SelPifs
Else 
	If (Count parameters:C259>=6)
		Cont_SelPifs($4; $5; $6)
	Else 
		Cont_SelPifs($4; $5)
	End if 
	
End if 

Master_UseSS($1)
//DEFAULT TABLE($1->)
Load_ManyFast(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; $3; $2; $1)
ERR_MethodTrackerReturn("Cont_SelPOther"; $_t_oldMethodName)