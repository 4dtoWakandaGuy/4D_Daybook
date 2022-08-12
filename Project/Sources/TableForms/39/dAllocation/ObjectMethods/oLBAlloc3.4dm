If (False:C215)
	//object Name: [INVOICES]dAllocation.oLBAlloc3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_abo_Select;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305($_bo_ExactMatch; $_bo_Warn)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Index; $_l_Row; $_l_TableNumber; GEN_l_NameSelected)
	C_REAL:C285($_r_Total; V31)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dAllocation.oLBAlloc3"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		INV_abo_Select:=$_l_Row
		
		GEN_l_NameSelected:=1
		$_r_Total:=0
		$_bo_ExactMatch:=True:C214
		$_bo_Warn:=False:C215
		For ($_l_Index; 1; Size of array:C274(GEN_at_Name))
			If (INV_abo_Select{$_l_Index})
				If (Not:C34($_bo_ExactMatch))
					$_r_Total:=$_r_Total+Num:C11(GEN_at_RecordCode{$_l_Index})
					If ($_r_Total=V31)
						//this is the total
						$_bo_ExactMatch:=True:C214
						$_bo_Warn:=True:C214
					End if 
				Else 
					If ($_bo_Warn)
						Gen_Confirm("You have already allocated the exact amount of the invoice, you may not allocate "+"additional")
						
						INV_abo_Select{INV_abo_Select}:=False:C215
						$_bo_Warn:=False:C215
					End if 
					
				End if 
				
			End if 
			
		End for 
		If ($_r_Total>V31)
			Gen_Alert("You have now allocated deposits greater than the sum of the invoice, you should n"+"ot select and more deposits")
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dAllocation.oLBAlloc3"; $_t_oldMethodName)
