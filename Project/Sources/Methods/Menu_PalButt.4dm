//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_PalButt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/05/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MenuBarSelected; $_l_MenuSelected; $_l_MenutItem; $_l_Process; DB_l_ButtonClickedFunction)
	C_TEXT:C284(<>ButtDis; $_t_MenuFileName; $_t_MenuName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_PalButt")
//Menu_PalButt - see also scripts of Silver & Gold Buttons Palettes
//this one is the same as Silver
$_l_MenuSelected:=Menu selected:C152
$_l_MenuBarSelected:=$_l_MenuSelected\65536
$_t_MenuName:=Get menu title:C430($_l_MenuSelected\65536)
$_t_MenuFileName:=Get localized string:C991("Menu_File")
If ($_t_MenuName=$_t_MenuFileName) | ($_l_MenuBarSelected=1)
	$_l_MenutItem:=$_l_MenuSelected%65536
	$_l_Process:=Frontmost process:C327(*)
	Case of 
		: ($_l_MenutItem=2)
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Cancel"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=1)
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("OK"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=3)
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Delete"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=5)  //4
			If (Substring:C12(<>ButtDis; 1; 1)="I")
				If (Substring:C12(<>ButtDis; 4; 1)#"P")
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Plus"))
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
			Else 
				SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Plus"))
				POST OUTSIDE CALL:C329($_l_Process)
			End if 
		: ($_l_MenutItem=7)  //5
			If (Substring:C12(<>ButtDis; 1; 1)="I")
				If (Substring:C12(<>ButtDis; 5; 1)#"M")
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Minus"))
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
			Else 
				SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Minus"))
				POST OUTSIDE CALL:C329($_l_Process)
			End if 
		: ($_l_MenutItem=6)
			If (Substring:C12(<>ButtDis; 1; 1)="I")
				If (Substring:C12(<>ButtDis; 6; 1)#"O")
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Open"))
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
			Else 
				SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Open"))
				POST OUTSIDE CALL:C329($_l_Process)
			End if 
		: ($_l_MenutItem=10)  //7
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Previous"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=9)  //8
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Next"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=12)  //9
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Select"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=17)  //10
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Apply"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=13)  //11
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Sort"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=14)  //12
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Count"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=15)  //13
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Report"))
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenutItem=16)  //14
			SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Graph"))
			POST OUTSIDE CALL:C329($_l_Process)
	End case 
End if 
ERR_MethodTrackerReturn("Menu_PalButt"; $_t_oldMethodName)
