If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable21
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
	//ARRAY BOOLEAN(MOD_abo_ShowLabel;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vMod3)
	C_LONGINT:C283($_l_event; $_l_Index; PER_l_ShowText)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable21"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		For ($_l_Index; 1; Size of array:C274(MOD_abo_ShowLabel))
			MOD_abo_ShowLabel{$_l_Index}:=(PER_l_ShowText=1)
			MOD_al_ShowLabel{$_l_Index}:=Num:C11(MOD_abo_ShowLabel{$_l_Index})
			vMod3:=True:C214
			DB_bo_RecordModified:=True:C214
		End for 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable21"; $_t_oldMethodName)
