If (False:C215)
	//Table Form Method Name: [COMPANIES]Text_Expand
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_FontsInited; DB_bo_NoLoad; TE_bo_Modifiable)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; $_t_oldMethodName; VComments)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Text_Expand"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Header:K2:17)
		WS_AutoscreenSize(1; 345; 541)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "Text_Expand")
		
		If (TE_bo_Modifiable=False:C215)
			OBJECT SET ENTERABLE:C238(VComments; False:C215)
		End if 
		If (Not:C34(DB_bo_FontsInited))
			DB_SetDefaultFonts
		End if 
		
		WS_AutoscreenSize(1; 345; 541; Table name:C256(->[COMPANIES:2])+"_"+"Text_Expand")
		If (Length:C16(VCOMMENTS)>1500)
			
			//FONT(VCOMMENTS;"TIMES")
			// FONT SIZE(VCOMMENTS;8)
			OBJECT SET FONT:C164(VCOMMENTS; <>SYS_t_DefaultFontBold)
			
			OBJECT SET FONT SIZE:C165(VCOMMENTS; 10)
			OBJECT SET FONT STYLE:C166(VCOMMENTS; 32)
		Else 
			OBJECT SET FONT:C164(VCOMMENTS; <>SYS_t_DefaultFontBold)
			
			OBJECT SET FONT SIZE:C165(VCOMMENTS; 10)
		End if 
End case 

Text_ExpandLP
ERR_MethodTrackerReturn("FM:Text_Expand"; $_t_oldMethodName)
