If (False:C215)
	//Table Form Method Name: [INFORMATION]Information_SubPC
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INFORMATION].Information_SubPC"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INFORMATION:55]); "Information_SubPC")
		If ([INFORMATION:55]QualityID:14>0)
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
			[INFORMATION:55]SubGroup:6:=[LIST_ITEMS:95]List_Entry:2
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityGroupID:15)
			[INFORMATION:55]Group:2:=[LIST_ITEMS:95]List_Entry:2
		End if 
End case 
ERR_MethodTrackerReturn("FM [INFORMATION].Information_SubPC"; $_t_oldMethodName)
