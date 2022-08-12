If (False:C215)
	//object Name: [DIARY]SD2_InputNOTE.oDiaryLinksButtonP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_InputNOTE.oDiaryLinksButtonP1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
		
		DIALOG:C40([USER:15]; "SD2_DiaryRelationsDialog")
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		CLOSE WINDOW:C154
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_InputNOTE.oDiaryLinksButtonP1"; $_t_oldMethodName)
