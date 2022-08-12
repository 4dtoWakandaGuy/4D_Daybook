If (False:C215)
	//Table Form Method Name: [USER]SD2_DIaryEntryFormSelect
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
	//ARRAY TEXT(SD2_at_FormNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; SD2_t_VirtualFormName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_DIaryEntryFormSelect"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		WS_AutoscreenSize(2; 110; 360)
		OpenHelp(Table:C252(->[USER:15]); "SD2_DiaryEntryFormSelect")
		
		SD2_t_VirtualFormName:=""
		SD2_at_FormNames:=0
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_DIaryEntryFormSelect"; $_t_oldMethodName)
