If (False:C215)
	//object Name: [USER]User_In.Button16
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
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	C_BOOLEAN:C305(EW_bo_ModifiedSettings)
	C_LONGINT:C283($iSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button16"; Form event code:C388)
//NG-TODO
//$iSelected:=AL_GetLine (eALFieldMap)
Case of 
	: ($iSelected<1)
		Gen_Alert("Please select a Daybook field to clear.")
		
	: (EW_at_BKFieldNames{$iSelected}="")
		Gen_Alert("There is nothing to clear from the selected field.")
	: (EW_at_BKFieldNames{$iSelected}="cuspersoa1")
		Gen_Alert("Sorry, you cannot change this field.")
	: (EW_at_BKFieldNames{$iSelected}="cuspersoa2")
		Gen_Alert("Sorry, you cannot change this field.")
	: (EW_at_BKFieldNames{$iSelected}="C04")
		Gen_Alert("Sorry, you cannot change this field.")
	: (EW_at_BKFieldNames{$iSelected}="T01")
		Gen_Alert("Sorry, you cannot change this field.")
	Else 
		EW_at_BKFieldNames{$iSelected}:=""
		//AL_UpdateArrays (eALFieldMap;-2)
		EW_bo_ModifiedSettings:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button16"; $_t_oldMethodName)
