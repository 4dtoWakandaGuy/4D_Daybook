If (False:C215)
	//object Name: [USER]PER_EmailAddresses.oLBMailAddresses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 15:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_lb_emailaddresses;0)
	//ARRAY TEXT(PER_at_DefaultHostAddresses;0)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	C_BOOLEAN:C305(USR_bo_Modified)
	C_LONGINT:C283($_l_ColumnNumber; $_l_CurrentSelected; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; PER_l_CurrentSelected)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; PER_t_DefaultHostAddress; PER_T_DefaultSignature; PER_t_EmailAddress; PER_t_EmailName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PER_EmailAddresses.oLBMailAddresses"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->PER_lb_emailaddresses; $_t_VariableName)
		If ($_l_Row>0)
			$_l_CurrentSelected:=$_l_Row
			If (PER_l_CurrentSelected>0)
				If (PER_t_EmailName#"") | (PER_t_EmailAddress#"")
					If (PER_t_EmailName="")
						PER_t_EmailName:=PER_t_EmailAddress
					End if 
					Gen_Confirm("Save "+PER_t_EmailName+"?")
					If (OK=1)
						If (PER_l_CurrentSelected<0)
							INSERT IN ARRAY:C227(PER_at_EmailNames; Size of array:C274(PER_at_EmailNames)+1; 1)
							INSERT IN ARRAY:C227(PER_at_EmailAddresses; Size of array:C274(PER_at_EmailAddresses)+1; 1)
							INSERT IN ARRAY:C227(PER_at_DefaultHostAddresses; Size of array:C274(PER_at_EmailAddresses)+1; 1)
							INSERT IN ARRAY:C227(PER_at_DefaultSignatures; Size of array:C274(PER_at_EmailAddresses)+1; 1)
							
							PER_l_CurrentSelected:=Size of array:C274(PER_at_EmailAddresses)
						End if 
						USR_bo_Modified:=True:C214
						PER_at_EmailNames{PER_l_CurrentSelected}:=PER_t_EmailName
						PER_at_EmailAddresses{PER_l_CurrentSelected}:=PER_t_EmailAddress
						PER_at_DefaultHostAddresses{PER_l_CurrentSelected}:=PER_t_DefaultHostAddress
						PER_at_DefaultSignatures{PER_l_CurrentSelected}:=PER_T_DefaultSignature
						
					End if 
					
				End if 
			End if 
			
			PER_l_CurrentSelected:=$_l_CurrentSelected
			PER_t_EmailName:=PER_at_EmailNames{PER_l_CurrentSelected}
			PER_t_EmailAddress:=PER_at_EmailAddresses{PER_l_CurrentSelected}
			PER_t_DefaultHostAddress:=PER_at_DefaultHostAddresses{PER_l_CurrentSelected}
			PER_T_DefaultSignature:=PER_at_DefaultSignatures{PER_l_CurrentSelected}
			OBJECT SET VISIBLE:C603(PER_T_DefaultSignature; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].PER_EmailAddresses.oLBMailAddresses"; $_t_oldMethodName)
