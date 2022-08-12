If (False:C215)
	//object Name: [COMPANIES]CO_NewsSettings.oLBSearchOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 18:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	C_LONGINT:C283($_l_event; $_l_Row; CO_al_CurSearchOpt)
	C_TEXT:C284($_t_oldMethodName; CO_T_SearchConstruct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].CO_NewsSettings.oLBSearchOptions"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_Row:=Self:C308->
		
		If ($_l_Row>0)
			If (CO_al_CurSearchOpt>0)
				If (CO_T_SearchConstruct#CO_at_SearchConstructs{CO_al_CurSearchOpt})
					Gen_Confirm("Save Changes to the Search URL?")
					If (OK=1)
						CO_at_SearchConstructs{CO_al_CurSearchOpt}:=CO_T_SearchConstruct
						CO_T_SearchConstruct:=""
					End if 
				End if 
				
			End if 
			CO_T_SearchConstruct:=CO_at_SearchConstructs{$_l_Row}
			CO_al_CurSearchOpt:=$_l_Row
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].CO_NewsSettings.oLBSearchOptions"; $_t_oldMethodName)
