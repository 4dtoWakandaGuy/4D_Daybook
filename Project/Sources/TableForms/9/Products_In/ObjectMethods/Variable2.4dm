If (False:C215)
	//object Name: [PRODUCTS]Products_In.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vButtDisPro)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284(vButtDisPro; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_In.Variable2"; Form event code:C388)
If (PRD_at_ProductsTab#FORM Get current page:C276) & (PRD_at_ProductsTab>0)
	FORM GOTO PAGE:C247(PRD_at_ProductsTab)
	If (Size of array:C274(PRD_aPtr_RelatedConfiguration)>=9)
		
		$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			//$name:=$_ptr_ArrayReferences->{10}
			Case of 
				: (PRD_at_ProductsTab=3)
					In_ButtChkDis(->vButtDisPro; "Product"; "Component")
				: (PRD_at_ProductsTab=2)
					In_ButtChkDis(->vButtDisPro; "Product"; "Further Analysis")
				: (PRD_at_ProductsTab=1)
					In_ButtChkDis(->vButtDisPro; "Product"; "Supplier")
			End case 
		Else 
			In_ButtChkDis(->vButtDisPro; "Product")
			
		End if 
	Else 
		
		
		In_ButtChkDis(->vButtDisPro)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Products_In,PRD_at_ProductsTab"; $_t_oldMethodName)
