If (False:C215)
	//Table Form Method Name: [USER]INT_OUTPUTBACKGROUND_DEEP
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
	C_LONGINT:C283($_l_event; INT_l_OutputBackGround; INT_l_OutputColor; INT_l_OutputForeground)
	C_TEXT:C284($_t_oldMethodName; INT_t_OutputBackGround; INT_t_OutputForeground)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].INT_OUTPUTBACKGROUND_DEEP"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "INT_OUTPUTBACKGROUND_DEEP")
		//INT_l_OutputColor:=0
		//_O_OBJECT SET COLOR(*;"oStrapHeader";INT_l_OutputColor)
		OBJECT SET RGB COLORS:C628(*; "oStrapHeader"; INT_t_OutputForeground; INT_t_OutputBackGround)
		
End case 
ERR_MethodTrackerReturn("FM [USER].INT_OUTPUTBACKGROUND_DEEP"; $_t_oldMethodName)
