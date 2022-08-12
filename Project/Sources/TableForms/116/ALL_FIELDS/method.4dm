If (False:C215)
	//Table Form Method Name: [PREFERENCES]ALL_FIELDS
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
	C_REAL:C285(PER_Blobsize)
	C_TEXT:C284($_t_oldMethodName; PRE_Prefname)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PREFERENCES].ALL_FIELDS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		PER_Blobsize:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[PREFERENCES:116]IDNumber:1)
		PRE_Prefname:=[LIST_ITEMS:95]List_Entry:2
		
End case 
ERR_MethodTrackerReturn("FM [PREFERENCES].ALL_FIELDS"; $_t_oldMethodName)
