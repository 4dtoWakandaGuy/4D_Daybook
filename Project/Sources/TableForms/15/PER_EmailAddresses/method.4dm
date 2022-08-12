If (False:C215)
	//Table Form Method Name: [USER]PER_EmailAddresses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 15:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_lb_emailaddresses;0)
	//ARRAY TEXT(PER_at_DefaultHostAddresses;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	C_BOOLEAN:C305(USR_bo_Modified; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_WIndowBottom; $_l_WindowHeight; $_l_WIndowLeft; $_l_WIndowRIght; $_l_WIndowTop; BSave; PER_l_BUT1; PER_l_But2; PER_l_BUT3; PER_l_BUT4)
	C_LONGINT:C283(PER_l_BUT5; PER_l_BUT6; PER_l_BUT7; PER_l_BUT8; PER_l_BUT9; PER_l_CurrentSelected; PER_l_UserModifiable; PER_l_UserModifiable2)
	C_TEXT:C284($_t_oldMethodName; PER_t_EmailAddress; PER_t_EmailName; PER_t_COL1; PER_t_COL2; PER_t_COL3; PER_t_COL4; PER_t_COL5; PER_t_COL6; PER_t_COL7; PER_t_COL8)
	C_TEXT:C284(PER_t_COL9; PER_t_HED1; PER_t_HED2; PER_t_HED3; PER_t_HED4; PER_t_HED5; PER_t_HED6; PER_t_HED7; PER_t_HED8; PER_t_HED9; PER_T_DefaultSignature)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].PER_EmailAddresses"; Form event code:C388)
//changes for form [user]per_emaiAddresses

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "PER_EmailAddresses")
		PER_l_UserModifiable2:=PER_l_UserModifiable
		USR_bo_Modified:=False:C215
		BSave:=0
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRIght; $_l_WIndowBottom)
		$_l_WIndowRIght:=$_l_WIndowLeft+700
		$_l_WindowHeight:=207
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRIght; $_l_WIndowTop+$_l_WindowHeight)
		PER_at_EmailNames:=0
		PER_at_EmailAddresses:=0
		PER_l_CurrentSelected:=-1
		PER_t_EmailName:=""
		PER_t_EmailAddress:=""
		PER_T_DefaultSignature:=""
		OBJECT SET VISIBLE:C603(PER_T_DefaultSignature; False:C215)
		
		INT_SetDialog
		
		
		
		LB_SetupListbox(->PER_lb_emailaddresses; "PER_t"; "PER_L"; 1; ->PER_at_EmailNames; ->PER_at_EmailAddresses; ->PER_at_DefaultHostAddresses)
		
		LB_SetColumnHeaders(->PER_lb_emailaddresses; "PER_L"; 1; "Sender Name"; "Sender Email Address"; "Mail Host for this address")
		
		LB_SetColumnWidths(->PER_lb_emailaddresses; "PER_t"; 1; 172; 192; 192)
		LB_SetScroll(->PER_lb_emailaddresses; -3; -2)
		LB_StyleSettings(->PER_lb_emailaddresses; "Black"; 9; "PER_t"; ->[PREFERENCES:116])
		
		LB_SetEnterable(->PER_lb_emailaddresses; False:C215; 0)
		
		
End case 
ERR_MethodTrackerReturn("FM [USER].PER_EmailAddresses"; $_t_oldMethodName)
