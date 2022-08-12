If (False:C215)
	//object Name: [USER]Per_EmailHosts.oLBHostNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:17
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_LB_HostNames;0)
	//ARRAY TEXT(PER_at_EmailHostNames;0)
	C_BOOLEAN:C305(USR_bo_Modified)
	C_LONGINT:C283($_l_ColumnNumber; $_l_CurrentSelected; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; PER_l_CurrentSelected)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; PER_t_EmailHostName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Per_EmailHosts.oLBHostNames"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->PER_LB_HostNames; $_t_VariableName)
		If ($_l_Row>0)
			
			$_l_CurrentSelected:=$_l_Row
			If (PER_l_CurrentSelected>0)
				If (PER_t_EmailHostName#"")
					
					Gen_Confirm("Save "+PER_t_EmailHostName+"?")
					If (OK=1)
						If (PER_l_CurrentSelected<0)
							INSERT IN ARRAY:C227(PER_at_EmailHostNames; Size of array:C274(PER_at_EmailHostNames)+1; 1)
							PER_l_CurrentSelected:=Size of array:C274(PER_at_EmailHostNames)
						End if 
						PER_at_EmailHostNames{PER_l_CurrentSelected}:=PER_t_EmailHostName
						USR_bo_Modified:=True:C214
					End if 
					
				End if 
			End if 
			
			PER_l_CurrentSelected:=$_l_CurrentSelected
			PER_t_EmailHostName:=PER_at_EmailHostNames{PER_l_CurrentSelected}
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].Per_EmailHosts.oLBHostNames"; $_t_oldMethodName)
