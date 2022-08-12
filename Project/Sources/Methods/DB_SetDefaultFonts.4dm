//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetDefaultFonts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 09:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_FontsInited)
	C_LONGINT:C283(<>iOS; <>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; <>SYS_l_WindowTop)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; <>SYS_t_PlatformSetting; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetDefaultFonts")
If (Not:C34(DB_bo_FontsInited))
	Case of 
		: (Is macOS:C1572)  //PowepC
			<>iOS:=Int:C8(Num:C11(DB_GetVersionNum(DBGetOSVersion)))
			<>SYS_t_PlatformSetting:="P"
			<>SYS_l_WindowTop:=20  //22
			<>SYS_t_DefaultFontBold:="Futura"
			<>SYS_l_DefaultBoldFontSize:=11
			<>SYS_t_DefaultFontPlain:="Gill Sans"
			<>SYS_l_DefaultPlainFontSize:=12
			//◊FontPlain:="Geneva"
		: (Is Windows:C1573)
			<>SYS_t_PlatformSetting:="W"
			<>SYS_l_WindowTop:=20  //42 `44
			<>SYS_t_DefaultFontBold:="Franklin Gothic Medium"
			<>SYS_l_DefaultBoldFontSize:=11
			<>SYS_t_DefaultFontPlain:="Microsoft Sans Serif"
			<>SYS_l_DefaultPlainFontSize:=11
		Else   //This should never be happened
			<>SYS_t_PlatformSetting:="P"
			<>SYS_l_WindowTop:=20  //22
			<>SYS_t_DefaultFontBold:="Espy Sans Bold"
			<>SYS_t_DefaultFontPlain:="Espy Sans"
	End case 
	DB_bo_FontsInited:=True:C214
End if 
ERR_MethodTrackerReturn("DB_SetDefaultFonts"; $_t_oldMethodName)