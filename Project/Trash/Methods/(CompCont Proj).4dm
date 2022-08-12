//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      CompCont_Proj
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SelOr)
	C_POINTER:C301($_Ptr_Table; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CompCont_Proj")
MESSAGES OFF:C175
Comp_Sel4($1)
If (Records in selection:C76([COMPANIES:2])>0)
	Project_SelFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; Table:C252(Table:C252($2)); $2)
End if 
If ((Records in selection:C76([CONTACTS:1])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
	Cont_SelFS($1)
	If (Records in selection:C76([CONTACTS:1])>0)
		$_Ptr_Table:=Table:C252(Table:C252($3))
		If (((<>SelOr) & (vAutoFind=False:C215)) & (Records in selection:C76($_Ptr_Table->)>0))
			CREATE SET:C116($_Ptr_Table->; "Master3")
			Project_SelFast(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; Table:C252(Table:C252($3)); $3)
			CREATE SET:C116($_Ptr_Table->; "Extra")
			UNION:C120("Master3"; "Extra"; "Master3")
			USE SET:C118("Master3")
			CLEAR SET:C117("Master3")
			
		Else 
			Project_SelFast(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; Table:C252(Table:C252($3)); $3)
		End if 
	End if 
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("CompCont_Proj"; $_t_oldMethodName)