If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Button3
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
	//ARRAY LONGINT(SP_al_RecordModified;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Button3"; Form event code:C388)
If (Size of array:C274(SP_al_SalesProjectionID)>0)
	For ($_l_Index; 1; Size of array:C274(SP_al_RecordModified))
		If (SP_al_RecordModified{$_l_Index}>0)
			SP_UpdateTargetFromPV($_l_Index)
		End if 
	End for 
	<>NoUpdate:=False:C215
End if 
<>NoUpdate:=False:C215


CANCEL:C270
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Button3"; $_t_oldMethodName)
