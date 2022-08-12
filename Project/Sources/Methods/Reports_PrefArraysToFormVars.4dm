//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefArraysToFormVars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefArraysToFormVars
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_EmailPrintOption2Roles;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	C_LONGINT:C283($_l_SelectedRow; $1)
	C_TEXT:C284($_t_oldMethodName; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefArraysToFormVars")

//Added 23/02/09 v631b120o -kmw
If (Count parameters:C259>=1)
	$_l_SelectedRow:=$1
Else 
	$_l_SelectedRow:=0
End if 


If (False:C215)
	//If (Size of array(SR_at_EmailPrintOption2Roles)>0)
	SR_t_EmailPrintOption2Role:=""
	SR_t_EmailPrintOption2Cont:=""
	SR_t_EmailPrintOption2Pers:=""
	SR_t_EmailPrintOption2Email:=""
	//If (Size of array(SR_at_EmailPrintOption2Roles)>=3)
	//SR_t_EmailPrintOption2Role:=SR_at_EmailPrintOption2Roles{3}
	//End if 
	//If (Size of array(SR_at_EmailPrintOption2Roles)>=6)
	//SR_t_EmailPrintOption2Cont:=SR_at_EmailPrintOption2Roles{6}
	//End if 
	//If (Size of array(SR_at_EmailPrintOption2Roles)>=7)
	//SR_t_EmailPrintOption2Pers:=SR_at_EmailPrintOption2Roles{7}
	//End if 
	//If (Size of array(SR_at_EmailPrintOption2Roles)>=8)
	//SR_t_EmailPrintOption2Email:=SR_at_EmailPrintOption2Roles{8}
	//End if 
	
	//SR_t_EmailPrintOption3Role:=SR_at_EmailPrintOption3Val{4}
	//SR_t_EmailPrintOption3Cont:=SR_at_EmailPrintOption3Val{7}
	//SR_t_EmailPrintOption3Pers:=SR_at_EmailPrintOption3Val{8}
	//SR_t_EmailPrintOption3Email:=SR_at_EmailPrintOption3Val{9}
	//End if 
End if 
ERR_MethodTrackerReturn("Reports_PrefArraysToFormVars"; $_t_oldMethodName)
