If (False:C215)
	//Table Form Method Name: [MAILSORT_MAIL]Out_CO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; SIZ_l_OLDBOTTOM; SIZ_l_OLDLEFT; SIZ_l_OLDRIGHT; SIZ_l_OLDTOP)
	C_TEXT:C284($_t_oldMethodName; vButtDisMS; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [MAILSORT_MAIL].Out_CO"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		INT_Setoutput(Table:C252(->[MAILSORT_MAIL:83]); WIN_t_CurrentOutputform)
	: ($_l_event=On Display Detail:K2:22)
		If (([MAILSORT_MAIL:83]Record_Number:1>0) & ([MAILSORT_MAIL:83]Record_Number:1#999999))
			GOTO RECORD:C242([MAILSORT_MAIL:83]Record_Number:1)
			Mail_MSRel
		Else 
			UNLOAD RECORD:C212([COMPANIES:2])
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[MAILSORT_MAIL:83]); "Out_CO")
		Cache_Initialise
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[MAILSORT_MAIL:83]); "Out_CO")
		vButtDisMS:="O  P    F      DT"
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[MAILSORT_MAIL:83]; ->[MAILSORT_MAIL:83]SSC:3; ->[MAILSORT_MAIL:83]SSC:3; "Mailsort"; ""; ""; "Minor_Del"; "Master"; ""; ""; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[MAILSORT_MAIL:83])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisMS:="O  P    F      DT"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM:Out_CO"; $_t_oldMethodName)
