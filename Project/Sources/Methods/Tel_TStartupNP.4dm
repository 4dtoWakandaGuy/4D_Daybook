//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_TStartupNP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>TEL_al_4DProcess;0)
	//ARRAY LONGINT(<>TEL_al_ResourceID;0)
	//ARRAY LONGINT(<>TEL_al_TVProcess;0)
	//ARRAY TEXT(<>TEL_at_Processname;0)
	//ARRAY TEXT(<>TEL_at_ResourceTypes;0)
	C_BOOLEAN:C305(<>Tel_bo_Quitting)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_TStartupNP")
//Tel_TStartupNP - No processes
ARRAY TEXT:C222(<>TEL_at_ResourceTypes; 0)  //resource type associated with this line = NVOX, NVFX etc
ARRAY LONGINT:C221(<>TEL_al_ResourceID; 0)  //resource ID - first NVOX = 1 etc
ARRAY LONGINT:C221(<>TEL_al_4DProcess; 0)  //the 4D Process associated with this 'application' or line
ARRAY LONGINT:C221(<>TEL_al_TVProcess; 0)
ARRAY TEXT:C222(<>TEL_at_Processname; 0)  //the NAMED 4D PROCEDURE
<>Tel_bo_Quitting:=False:C215
ERR_MethodTrackerReturn("Tel_TStartupNP"; $_t_oldMethodName)