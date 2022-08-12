If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oLBMailRules
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_abo_Locationavailable;0)
	//ARRAY BOOLEAN(STK_abo_LocationInclude;0)
	//ARRAY LONGINT(STK_al_LocationSettings;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Number1; $_l_Number2; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oLBLocationAccess"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		$_l_Row:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_t_VariableName="STK_abo_LocationInclude")
				$_l_Number1:=Num:C11(STK_abo_LocationInclude{$_l_Row})
				$_l_Number2:=Num:C11(STK_abo_Locationavailable{$_l_Row})
				STK_al_LocationSettings{$_l_Row}:=($_l_Number1+$_l_Number2)-1
			: ($_t_VariableName="STK_abo_Locationavailable")
				$_l_Number1:=Num:C11(STK_abo_LocationInclude{$_l_Row})
				$_l_Number2:=Num:C11(STK_abo_Locationavailable{$_l_Row})
				STK_al_LocationSettings{$_l_Row}:=($_l_Number1+$_l_Number2)-1
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oLBLocationAccess"; $_t_oldMethodName)
