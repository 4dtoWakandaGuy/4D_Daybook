If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dMergeSpecial
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; rCont)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dMergeSpecial"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	OpenHelp(Table:C252(->[DOCUMENTS:7]); "dMergeSpecial")
	rCont:=1
	INT_SetDialog
	
End if 
ERR_MethodTrackerReturn("FM [DOCUMENTS].dMergeSpecial"; $_t_oldMethodName)
