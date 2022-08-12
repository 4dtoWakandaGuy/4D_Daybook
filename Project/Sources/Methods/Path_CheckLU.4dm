//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_CheckLU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/06/2010 07:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Mod_al_ModuleAccessType;0)
	ARRAY LONGINT:C221($_al_ModuleAccessType; 0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	C_LONGINT:C283(<>ConIMUsers; <>ConWPUsers; <>Mod_l_MaxModules; <>SYS_l_MaxConnectedUsers; $_l_Char0; $_l_Char1; $_l_Char2; $_l_CharCode1; $_l_CharCode10; $_l_CharCode2; $_l_CharCode3)
	C_LONGINT:C283($_l_CharCode4; $_l_CharCode5; $_l_CharCode6; $_l_CharCode7; $_l_CharCode8; $_l_CharCode9; $_l_CharIndex; $_l_CharIndex2; $_l_Denominator; $_l_NumUsers; $_l_PositionNumber)
	C_LONGINT:C283($_l_SilverAccessOLD; $_l_SumNumbers2; $_l_ThisCharCode; $_l_WPAccessOLD; $_t_NameSumNumbers1)
	C_TEXT:C284(<>PathName; $_l_Nominator; $_t_Divide; $_t_Divide1; $_t_Divideemo; $_t_LicenceVersion; $_t_NameSumNumbers; $_t_oldMethodName; $_t_PN; $_t_UserName; $0)
	C_TEXT:C284($1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_CheckLU")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 

//Path_CheckLU - Licence Update - increments the standard Licence
//See also Path_Check


$0:=""
$_l_SilverAccessOLD:=(DB_GetModuleSettingByNUM(1))
$_l_WPAccessOLD:=(DB_GetModuleSettingByNUM(Module_WPManager))
COPY ARRAY:C226(<>Mod_al_ModuleAccessType; $_al_ModuleAccessType)

$_t_PN:=""
$_l_CharIndex:=1
While ($_l_CharIndex<=Length:C16($1))
	IDLE:C311  // 7/04/03 pb
	$_l_ThisCharCode:=Character code:C91(Substring:C12($1; $_l_CharIndex; 1))
	If (($_l_ThisCharCode<48) | ($_l_ThisCharCode>57))
		If (($_l_ThisCharCode>96) & ($_l_ThisCharCode<123))
			$_t_PN:=$_t_PN+String:C10($_l_ThisCharCode-32)
		End if 
		If (($_l_ThisCharCode>64) & ($_l_ThisCharCode<91))
			$_t_PN:=$_t_PN+String:C10($_l_ThisCharCode-50)
		End if 
		If (($_l_ThisCharCode=47) | ($_l_ThisCharCode=92))
			$_t_PN:=$_t_PN+String:C10($_l_ThisCharCode)
		End if 
		If ($_l_ThisCharCode=45)
			$_t_PN:=$_t_PN+"00"
		End if 
	Else 
		$_t_PN:=$_t_PN+Substring:C12($1; $_l_CharIndex; 1)
	End if 
	$_l_CharIndex:=$_l_CharIndex+1
End while 

$_t_NameSumNumbers:=Substring:C12($_t_PN; 4; 4)
$_t_PN:=Substring:C12($_t_PN; 1; 3)+Substring:C12($_t_PN; 8; 99)
$_t_UserName:=DB_GetOrganisation
$_l_CharCode1:=Character code:C91(Substring:C12($_t_UserName; 1; 1))
$_l_CharCode2:=Character code:C91(Substring:C12($_t_UserName; 2; 1))
$_l_CharCode3:=Character code:C91(Substring:C12($_t_UserName; 3; 1))
$_l_CharCode4:=Character code:C91(Substring:C12($_t_UserName; 4; 1))
$_l_CharCode5:=Character code:C91(Substring:C12($_t_UserName; 5; 1))
$_l_CharCode6:=Character code:C91(Substring:C12($_t_UserName; 6; 1))
$_l_CharCode7:=Character code:C91(Substring:C12($_t_UserName; 7; 1))
$_l_CharCode8:=Character code:C91(Substring:C12($_t_UserName; 8; 1))
$_l_CharCode9:=Character code:C91(Substring:C12($_t_UserName; 9; 1))
$_l_CharCode10:=Character code:C91(Substring:C12($_t_UserName; 10; 1))
$_t_NameSumNumbers1:=$_l_CharCode1+$_l_CharCode2+$_l_CharCode3+$_l_CharCode4+$_l_CharCode5+$_l_CharCode6+$_l_CharCode7+$_l_CharCode8+$_l_CharCode9+$_l_CharCode10
$_l_SumNumbers2:=Num:C11($_t_NameSumNumbers)
$_t_NameSumNumbers:=""
If ($_l_SumNumbers2>5000)
	$_l_SumNumbers2:=$_l_SumNumbers2-5000
	If ($_t_NameSumNumbers1#$_l_SumNumbers2)
		$_t_NameSumNumbers:="No"
	End if 
End if 

If (Length:C16($_t_PN)>18)  //allow typer 4 numbers to pass
	$_l_PositionNumber:=Num:C11(Substring:C12($_t_PN; 1; 1))
	<>ConWPUsers:=<>ConWPUsers+Num:C11(Substring:C12($_t_PN; $_l_PositionNumber; 2))
	<>ConIMUsers:=<>ConWPUsers+Num:C11(Substring:C12($_t_PN; $_l_PositionNumber+2; 2))
	$_t_PN:=Substring:C12($_t_PN; 2; $_l_PositionNumber-2)+Substring:C12($_t_PN; $_l_PositionNumber+4; Length:C16($_t_PN)-5)
	Case of 
		: ($_l_PositionNumber=7)
			<>ConWPUsers:=<>ConWPUsers+99
		: ($_l_PositionNumber=8)
			<>ConIMUsers:=<>ConIMUsers+99
		: ($_l_PositionNumber=9)
			<>ConWPUsers:=<>ConWPUsers+99
			<>ConIMUsers:=<>ConIMUsers+99
	End case 
End if 

$_l_PositionNumber:=Num:C11(Substring:C12($_t_PN; 1; 1))
$_l_NumUsers:=Num:C11(Substring:C12($_t_PN; $_l_PositionNumber; 2))
$_l_Nominator:=Substring:C12($_t_PN; 2; $_l_PositionNumber-2)+Substring:C12($_t_PN; $_l_PositionNumber+2; Length:C16($_t_PN)-3-$_l_PositionNumber-1)
$_l_Denominator:=Num:C11(Substring:C12($_t_PN; Length:C16($_t_PN)-2; 32000))
$_t_Divide:=Str_Divide($_l_Nominator; String:C10($_l_Denominator))
If ($_l_PositionNumber>6)
	$_l_NumUsers:=$_l_NumUsers+99
End if 

If ($_l_NumUsers>0)
	<>SYS_l_MaxConnectedUsers:=<>SYS_l_MaxConnectedUsers+$_l_NumUsers
	
	$0:=$0+String:C10($_l_NumUsers)+" extra user"+("s"*Num:C11($_l_NumUsers#1))+"; "
End if 

//Type 4
If (($_l_PositionNumber>2) & ($_l_NumUsers<=99) & (Length:C16($_t_Divide)=16) & ($_l_Denominator>99) & ($_l_Denominator<900) & ($_t_Divide#"@9@"))
	If ($_t_NameSumNumbers="")
		$_t_LicenceVersion:=Substring:C12($_t_Divide; 15; 1)+"."+Substring:C12($_t_Divide; 16; 1)
		$_l_CharIndex:=1
		$_l_CharIndex2:=1
		While ($_l_CharIndex2<(<>Mod_l_MaxModules))
			IDLE:C311  // 7/04/03 pb
			$_t_Divide1:=Substring:C12($_t_Divide; $_l_CharIndex; 1)
			
			$_l_Char0:=(DB_GetModuleSettingByNUM($_l_CharIndex2))
			$_l_Char1:=(DB_GetModuleSettingByNUM($_l_CharIndex2+1))
			$_l_Char2:=(DB_GetModuleSettingByNUM($_l_CharIndex2+2))
			
			Case of 
				: ($_t_Divide1="2")
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+2}:=1
				: ($_t_Divide1="3")
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+1}:=1
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+2}:=1
				: ($_t_Divide1="4")
					<>Mod_al_ModuleAccessType{$_l_CharIndex2}:=1
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+1}:=1
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+2}:=1
				: ($_t_Divide1="5")
					<>Mod_al_ModuleAccessType{$_l_CharIndex2}:=1
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+1}:=1
				: ($_t_Divide1="6")
					<>Mod_al_ModuleAccessType{$_l_CharIndex2}:=1
				: ($_t_Divide1="7")
					<>Mod_al_ModuleAccessType{$_l_CharIndex2}:=1
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+2}:=1
				: ($_t_Divide1="8")
					<>Mod_al_ModuleAccessType{$_l_CharIndex2+1}:=1
			End case 
			
			If (($_l_Char0=0) & ((DB_GetModuleSettingByNUM($_l_CharIndex2))=1))
				If ($_l_CharIndex#1)
					$0:=$0+<>Mod_at_ModuleName{$_l_CharIndex2}+"; "
				End if 
			End if 
			If (($_l_Char1=0) & ((DB_GetModuleSettingByNUM($_l_CharIndex2+1))=1))
				$0:=$0+<>Mod_at_ModuleName{$_l_CharIndex2+1}+"; "
			End if 
			If (($_l_Char2=0) & ((DB_GetModuleSettingByNUM($_l_CharIndex2+2))=1))
				$0:=$0+<>Mod_at_ModuleName{$_l_CharIndex2+2}+"; "
			End if 
			
			$_l_CharIndex:=$_l_CharIndex+1
			$_l_CharIndex2:=$_l_CharIndex2+3
			If ($_l_CharIndex2=37)
				$_l_CharIndex2:=40
			End if 
		End while 
	Else 
		$0:="Err:the Update was designed for a different Organisation."
	End if 
Else 
	$0:="Err:if you are a registered Daybook user, please Contact Daybook for "+"assistance, quoting your main Licence No "+<>PathName+"."
End if 

If ((DB_GetModuleSettingByNUM(30))=1)
	<>Mod_al_ModuleAccessType{17}:=1
	<>Mod_al_ModuleAccessType{18}:=1
	<>Mod_al_ModuleAccessType{7}:=1
End if 

If ($_l_SilverAccessOLD=5)
	If ((DB_GetModuleSettingByNUM(1))#1)
		$0:="Err:the Update was designed for Daybook Gold only."
	Else 
		<>Mod_al_ModuleAccessType{1}:=5
	End if 
Else 
	If ((DB_GetModuleSettingByNUM(1))>0)
		$0:="Err:the Update was designed for Daybook Silver only."
	End if 
End if 

If ($_l_WPAccessOLD#(DB_GetModuleSettingByNUM(Module_WPManager)))
	If (<>ConWPUsers=0)
		<>ConWPUsers:=1
	End if 
End if 

If (Length:C16($0)>1)
	If (Substring:C12($0; Length:C16($0)-1; 2)="; ")
		$0:=Substring:C12($0; 1; Length:C16($0)-2)+"."
	End if 
End if 

If ($0="")
	$0:="Err:it contains no Updates that are new."
End if 

If ($0="Err:@")
	COPY ARRAY:C226($_al_ModuleAccessType; <>Mod_al_ModuleAccessType)
End if 
ERR_MethodTrackerReturn("Path_CheckLU"; $_t_oldMethodName)
