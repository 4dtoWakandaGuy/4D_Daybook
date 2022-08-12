If (False:C215)
	//object Name: [USER]User_In.oTableSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(USR_lb_TablesCodes;0)
	//ARRAY INTEGER(WS_aI_NumberHasBackslash;0)
	//ARRAY INTEGER(WS_aI_NumberIncludesOfficecode;0)
	//ARRAY INTEGER(WS_aI_Numberofleadingzeros;0)
	//ARRAY INTEGER(WS_aI_NumberUsesMultiNumber;0)
	//ARRAY LONGINT(WS_al_NumberCurrentValue;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_NewReference; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oTableSelect"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->USR_lb_TablesCodes; $_t_VariableName)
			Case of 
				: ($_l_Column=3)
					$_l_NewReference:=Num:C11(Request:C163("Enter new number: "; String:C10(WS_al_NumberCurrentValue{$_l_Row})))
					If ($_l_NewReference>0)
						If ($_l_NewReference>WS_al_NumberCurrentValue{$_l_Row})
							WS_al_NumberCurrentValue{$_l_Row}:=$_l_NewReference
						Else 
							Gen_Alert("You may not reduce the number, this may cause conflicts!")
						End if 
					End if 
				: ($_l_Column=4)
					WS_aI_NumberIncludesOfficecode{$_l_Row}:=Abs:C99(WS_aI_NumberIncludesOfficecode{$_l_Row}-1)
				: ($_l_Column=5)
					WS_aI_NumberHasBackslash{$_l_Row}:=Abs:C99(WS_aI_NumberHasBackslash{$_l_Row}-1)
				: ($_l_Column=6)
					$_l_NewReference:=Num:C11(Request:C163("Enter Quantity: "; String:C10(WS_aI_Numberofleadingzeros{$_l_Row})))
					
					If ($_l_NewReference>0)
						WS_aI_Numberofleadingzeros{$_l_Row}:=$_l_NewReference
					End if 
				: ($_l_Column=7)
					WS_aI_NumberUsesMultiNumber{$_l_Row}:=Abs:C99(WS_aI_NumberUsesMultiNumber{$_l_Row}-1)
			End case 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oTableSelect"; $_t_oldMethodName)
