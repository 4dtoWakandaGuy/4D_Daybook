//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadTemplateActions
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
	//ARRAY LONGINT(SD2_al_TemplateIDS;0)
	//ARRAY TEXT(SD2_at_TemplateNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadTemplateActions")
ARRAY LONGINT:C221(SD2_al_TemplateIDS; 0)
ARRAY TEXT:C222(SD2_at_TemplateNames; 0)
QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12<0)
SELECTION TO ARRAY:C260([ACTIONS:13]xID:12; SD2_al_TemplateIDS; [ACTIONS:13]Action_Name:2; SD2_at_TemplateNames)
ERR_MethodTrackerReturn("SD2_LoadTemplateActions"; $_t_oldMethodName)