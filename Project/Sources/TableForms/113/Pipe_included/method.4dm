If (False:C215)
	//Table Form Method Name: [SALES_PROJECTION]Pipe_included
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
	C_TEXT:C284($_t_oldMethodName; SP_S80_Customer)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SALES_PROJECTION].Pipe_included"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=1)
		
	: ($_l_event=8)
		If ([SALES_PROJECTION:113]CompanyID:6#[COMPANIES:2]x_ID:63)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=[SALES_PROJECTION:113]CompanyID:6)
			SP_S80_Customer:=[COMPANIES:2]Company_Name:2
		End if 
		
	Else 
		
End case 
ERR_MethodTrackerReturn("FM [SALES_PROJECTION].Pipe_included"; $_t_oldMethodName)
