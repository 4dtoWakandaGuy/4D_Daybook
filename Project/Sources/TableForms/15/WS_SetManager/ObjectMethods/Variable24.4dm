If (False:C215)
	//object Name: [USER]WS_SetManager.Variable24
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Name;0)
	C_LONGINT:C283($_l_SizeofArray; vNo)
	C_TEXT:C284(<>RecText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable24"; Form event code:C388)
$_l_SizeofArray:=Size of array:C274(GEN_at_Name)
If ((GEN_at_Name>0) & (GEN_at_Name<=$_l_SizeofArray))
	Are_You_Sure
	If (OK=1)
		MESSAGES OFF:C175
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=GEN_at_Name{GEN_at_Name})
		MESSAGES ON:C181
		DB_DeletionControl(->[SCRIPTS:80])
		
		DELETE RECORD:C58([SCRIPTS:80])
		DELETE FROM ARRAY:C228(GEN_at_Name; GEN_at_Name; 1)
		$_l_SizeofArray:=Size of array:C274(GEN_at_Name)
		If (GEN_at_Name>$_l_SizeofArray)
			GEN_at_Name:=$_l_SizeofArray
		End if 
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=GEN_at_Name{GEN_at_Name})
		<>RecText:=[SCRIPTS:80]Recording_Text:4
	End if 
End if 
vNo:=Size of array:C274(GEN_at_Name)
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable24"; $_t_oldMethodName)
