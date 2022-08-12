//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetDiaryAction
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
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	C_BOOLEAN:C305(SD2_bo_FieldNamesLoaded)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetDiaryAction")
//this method will extract the diary type
READ ONLY:C145([ACTIONS:13])

If ([DIARY:12]Action_Code:9#"")
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
	SD2_ActionAttributesToArrays
Else 
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; 0)
	ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; 0)
	ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; 0; 0)
	ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; 0; 0)
	
End if 
ERR_MethodTrackerReturn("SD2_GetDiaryAction"; $_t_oldMethodName)