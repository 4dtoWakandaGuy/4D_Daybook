If (False:C215)
	//object Name: [COMPANIES]dStartup_Export.olistbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Companies;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_TablePosition)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStartup_Export.olistbox"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			MOD_al_ModuleAccessStatus{$_l_Row}:=(Num:C11(MOD_al_ModuleAccessStatus{$_l_Row}=0)*(1-(2*(Num:C11(Gen_Option)))))
			If (MOD_al_ModuleAccessStatus{$_l_Row}#0)
				If ((<>DB_al_TableNums{$_l_Row}=30) | (<>DB_al_TableNums{$_l_Row}=37) | (<>DB_al_TableNums{$_l_Row}=39) | (<>DB_al_TableNums{$_l_Row}=41) | (<>DB_al_TableNums{$_l_Row}=42))
					Gen_Alert("NB: Exporting "+<>DB_at_TableNames{MOD_al_ModuleAccessStatus}+" is not recommended - the subfile items will not be exported")
				End if 
				If ((<>DB_al_TableNums{$_l_Row}=11) | (<>DB_al_TableNums{$_l_Row}=92))
					Gen_Confirm("NB: When exporting Personnel or Personnel Groups you will probably want to turn "+" on 'Modules' as well"; "Yes"; "No")
					If (OK=1)
						$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; 63)
						
						MOD_al_ModuleAccessStatus{$_l_TablePosition}:=MOD_al_ModuleAccessStatus{$_l_Row}
					End if 
				End if 
			End if 
			LISTBOX SELECT ROW:C912(COM_lb_Companies; 0; 0)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStartup_Export.olistbox"; $_t_oldMethodName)
