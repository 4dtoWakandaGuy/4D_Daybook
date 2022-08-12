If (False:C215)
	//Table Form Method Name: [USER]Per_EmailHosts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_LB_HostNames;0)
	//ARRAY TEXT(PER_at_EmailHostNames;0)
	C_BOOLEAN:C305(USR_bo_Modified; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_WIndowBottom; $_l_WindowHeight; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; BSave)
	C_TEXT:C284($_t_oldMethodName; PER_t_EmailHostName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Per_EmailHosts"; Form event code:C388)
//changes for form [user]per_emaiAddresses

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "PER_EmailHosts")
		
		USR_bo_Modified:=False:C215
		BSave:=0
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		$_l_WIndowRight:=$_l_WIndowLeft+400
		$_l_WindowHeight:=207
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowTop+$_l_WindowHeight)
		PER_at_EmailHostNames:=0
		
		PER_t_EmailHostName:=""
		INT_SetDialog
		LB_StyleSettings(->PER_LB_HostNames; "Black"; 9; "Prefs"; ->[PREFERENCES:116])
		LB_SetEnterable(->PER_LB_HostNames; False:C215; 0)
		
End case 
ERR_MethodTrackerReturn("FM [USER].Per_EmailHosts"; $_t_oldMethodName)
