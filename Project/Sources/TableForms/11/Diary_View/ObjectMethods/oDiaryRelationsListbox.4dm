If (False:C215)
	//object Name: [PERSONNEL]Diary_View.oDiaryRelationsListbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_RelationMenuNums;0)
	//ARRAY TEXT(SD_at_Arrayrelations;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oDiaryRelationsListbox"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		If (SD_at_Arrayrelations>0)
			SDiary_MenV(SD_al_RelationMenuNums{SD_at_Arrayrelations})
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oDiaryRelationsListbox"; $_t_oldMethodName)
