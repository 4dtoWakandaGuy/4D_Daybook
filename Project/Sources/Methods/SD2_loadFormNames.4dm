//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_loadFormNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2012 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY LONGINT(SD2_al_FormPage;0)
	//ARRAY LONGINT(SD2_al_FormTables;0)
	//ARRAY TEXT(SD2_at_DisplayedFormNames;0)
	//ARRAY TEXT(SD2_at_FormNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_loadFormNames")

ARRAY TEXT:C222(SD2_at_DisplayedFormNames; 0)
ARRAY LONGINT:C221(SD2_al_FormTables; 0)
ARRAY LONGINT:C221(SD_al_FormReferenceID; 0)
ARRAY TEXT:C222(SD2_at_FormNames; 0)
ARRAY LONGINT:C221(SD2_al_FormPage; 0)
APPEND TO ARRAY:C911(SD2_at_DisplayedFormNames; "Contact Note")
APPEND TO ARRAY:C911(SD2_al_FormTables; Table:C252(->[DIARY:12]))
APPEND TO ARRAY:C911(SD2_at_FormNames; "ContactNote")
APPEND TO ARRAY:C911(SD_al_FormReferenceID; 1)
APPEND TO ARRAY:C911(SD2_al_FormPage; 1)

If (False:C215)
	APPEND TO ARRAY:C911(SD2_at_DisplayedFormNames; "Standard Scheduled Item Entry")
	APPEND TO ARRAY:C911(SD2_al_FormTables; Table:C252(->[DIARY:12]))
	APPEND TO ARRAY:C911(SD2_at_FormNames; "SD2_DefScheduleEntry")
	APPEND TO ARRAY:C911(SD_al_FormReferenceID; 2)
	APPEND TO ARRAY:C911(SD2_al_FormPage; 1)
	
	APPEND TO ARRAY:C911(SD2_at_DisplayedFormNames; "Simple note Enty")
	APPEND TO ARRAY:C911(SD2_al_FormTables; Table:C252(->[USER:15]))
	APPEND TO ARRAY:C911(SD2_at_FormNames; "SD2_SimpleEntry")
	APPEND TO ARRAY:C911(SD_al_FormReferenceID; 3)
	APPEND TO ARRAY:C911(SD2_al_FormPage; 2)
	
	APPEND TO ARRAY:C911(SD2_at_DisplayedFormNames; "Simple Contact note Entry")
	APPEND TO ARRAY:C911(SD2_al_FormTables; Table:C252(->[USER:15]))
	APPEND TO ARRAY:C911(SD2_at_FormNames; "SD2_SimpleEntry")
	APPEND TO ARRAY:C911(SD_al_FormReferenceID; 4)
	APPEND TO ARRAY:C911(SD2_al_FormPage; 3)
	
	APPEND TO ARRAY:C911(SD2_at_DisplayedFormNames; "Simple Workflow Task entry")
	APPEND TO ARRAY:C911(SD2_al_FormTables; Table:C252(->[USER:15]))
	APPEND TO ARRAY:C911(SD2_at_FormNames; "SD2_SimpleEntry")
	APPEND TO ARRAY:C911(SD_al_FormReferenceID; 4)
	APPEND TO ARRAY:C911(SD2_al_FormPage; 4)
End if 
ERR_MethodTrackerReturn("SD2_loadFormNames"; $_t_oldMethodName)