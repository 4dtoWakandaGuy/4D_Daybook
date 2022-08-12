If (False:C215)
	//object Name: [COMPANIES]dAsk_StartImp.oUserNameField5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_EndHighlight; $_l_EndofSelected; $_l_event; $_l_StartHighlight)
	C_TEXT:C284($_t_After; $_t_Before; $_t_EditedText; $_t_oldMethodName; DB_T_Offscreen2; DB_T_OffscreenTemp2; DB_t_Password2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_StartImp.oUserNameField5"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		SET TIMER:C645(10)
		$_t_EditedText:=Get edited text:C655
		GET HIGHLIGHT:C209(Self:C308->; $_l_StartHighlight; $_l_EndHighlight)
		If ($_l_EndHighlight<=Length:C16($_t_EditedText))
			$_l_EndofSelected:=$_l_EndHighlight-1
			DB_T_OffscreenTemp2:=$_t_EditedText
			Case of 
				: (Length:C16(DB_T_Offscreen2)<Length:C16(DB_T_OffscreenTemp2))
					$_t_Before:=Substring:C12(DB_T_Offscreen2; 1; $_l_EndofSelected-1)
					$_t_After:=Substring:C12(DB_T_Offscreen2; $_l_EndofSelected)
					
					DB_T_Offscreen2:=$_t_Before+DB_T_OffscreenTemp2[[$_l_EndofSelected]]+$_t_After
				: (Length:C16(DB_T_Offscreen2)>Length:C16(DB_T_OffscreenTemp2))
					$_t_Before:=Substring:C12(DB_T_Offscreen2; 1; $_l_EndofSelected)
					$_t_After:=Substring:C12(DB_T_Offscreen2; $_l_EndofSelected+2)
					DB_T_Offscreen2:=$_t_Before+$_t_After
			End case 
		Else 
			DB_T_OffscreenTemp2:=$_t_EditedText
			Case of 
				: (Length:C16(DB_T_Offscreen2)<Length:C16(DB_T_OffscreenTemp2))
					DB_T_Offscreen2:=DB_T_Offscreen2+Substring:C12(DB_T_OffscreenTemp2; Length:C16(DB_T_Offscreen2)+1)
				: (Length:C16(DB_T_Offscreen2)>Length:C16(DB_T_OffscreenTemp2))
					DB_T_Offscreen2:=Substring:C12(DB_T_Offscreen2; 1; Length:C16(DB_T_OffscreenTemp2))
					
			End case 
		End if 
		DB_t_Password2:="•"*Length:C16(DB_T_Offscreen2)
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Getting Focus:K2:7)
		
		GET HIGHLIGHT:C209(Self:C308->; $_l_StartHighlight; $_l_EndHighlight)
	: ($_l_event=17)
	Else 
		//TRACE
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_StartImp.oUserNameField5"; $_t_oldMethodName)
