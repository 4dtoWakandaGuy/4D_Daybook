If (False:C215)
	//Project Form Method Name: PROD_CODE_BUILDFORMATS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 09:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; PC_bo_AnyEdits; PC_bo_FormatModified; PC_bo_SectionModified)
	C_LONGINT:C283($_l_event; PC_l_CurrentLoadedFormat; PC_l_CurrentLoadedSection)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM PROD_CODE_BUILDFORMATS"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		WS_AutoscreenSize(3; 500; 720)
		PC_bo_AnyEdits:=False:C215
		PC_l_CurrentLoadedSection:=0
		PC_bo_SectionModified:=False:C215
		PC_l_CurrentLoadedFormat:=0
		PC_bo_FormatModified:=False:C215
		READ WRITE:C146([PRODUCT_BUILT_CODE_FORMAT:189])
		READ WRITE:C146([BUILT_CODE_FORMAT_SECTION:188])
		
		ALL RECORDS:C47([PRODUCT_BUILT_CODE_FORMAT:189])
		REDUCE SELECTION:C351([BUILT_CODE_FORMAT_SECTION:188]; 0)
		
End case 
ERR_MethodTrackerReturn("FM PROD_CODE_BUILDFORMATS"; $_t_oldMethodName)
