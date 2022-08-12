If (False:C215)
	//Table Form Method Name: [SALES_PROJECTION]Pseudo_blank
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


$_t_oldMethodName:=ERR_MethodTracker("FM [SALES_PROJECTION].Pseudo_blank"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SALES_PROJECTION:113]); "Pseudo_blank")
		//this form is blank-it causes the form we want displayed to show
		HIDE WINDOW:C436
		
		SP_ModifyPipeline([SALES_PROJECTION:113]x_ID:1)
		SHOW WINDOW:C435
		CANCEL:C270
End case 
ERR_MethodTrackerReturn("FM [SALES_PROJECTION].Pseudo_blank"; $_t_oldMethodName)
