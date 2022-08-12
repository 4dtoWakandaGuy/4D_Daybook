//%attributes = {}
If (False:C215)
	//Project Method Name:      Out_Buttons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PalPopup5; 0)
	C_BOOLEAN:C305(<>PER_bo_CurrentNoButtGrey; vFromIn)
	C_LONGINT:C283(<>BUTTPROC; <>InButtProc; <>PER_l_AccessLevel; <>PER_l_CurrentUserID; <>RecBarUp; DB_l_ButtonClickedFunction; DB_l_UserFormAccess; iCancel; iOK; oOK; vButt)
	C_LONGINT:C283(vProc)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284(<>ButtDis; $_t_oldMethodName; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_FormUsage; DB_t_FormUsage2; DB_t_FormUsage3; vButtDis; vButtDisApp; vButtDisBk; vButtDisCom)
	C_TEXT:C284(vButtDisCon; vButtDisDry; vButtDisInv; vButtDisJob; vButtDisMov; vButtDisO; vButtDisOI; vButtDisOrd; vButtDisPro; vButtDisSC; vButtDisTxt)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Out_Buttons")

//Out_Buttons
//this method is called at the start of displaying every output layout
//it sets the button string and calls the button bar to update it
//i have also added in a call to the Selection manager
//and now a call to the cache manager


If (oOK=1)
	CANCEL:C270
Else 
	Case of 
		: ((DB_t_FormUsage="Select") | (DB_t_FormUsage="Print"))
			vButtDisO:=Substring:C12(vButtDisO; 1; 2)+"DPMONP"+Substring:C12(vButtDisO; 9; 4)+"R"+Substring:C12(vButtDisO; 14; 1)+"ADT"
		: (DB_l_UserFormAccess>2)
			If (DB_l_UserFormAccess=3)
				vButtDisO:=Substring:C12(vButtDisO; 1; 2)+"DPMONP"+Substring:C12(vButtDisO; 9; 4)+"R"+Substring:C12(vButtDisO; 14; 1)+"A"+Substring:C12(vButtDisO; 16; 99)
			Else 
				vButtDisO:=Substring:C12(vButtDisO; 1; 2)+"D"+Substring:C12(vButtDisO; 4; 1)+"MONP"+Substring:C12(vButtDisO; 9; 6)+"A"+Substring:C12(vButtDisO; 16; 99)
			End if 
			If (Substring:C12(vButtDisO; 16; 1)="D")
				If (vButtDisO="O@")
					vButtDisO:=Substring:C12(vButtDisO; 1; 15)+" "+Substring:C12(vButtDisO; 17; 99)
				End if 
			End if 
		: (<>PER_l_AccessLevel>1)
			
			
			vButtDisO:=Substring:C12(vButtDisO; 1; 4)+"MONP"+Substring:C12(vButtDisO; 9; 6)+"A"+Substring:C12(vButtDisO; 16; 99)
			If (Substring:C12(vButtDisO; 16; 1)="D")
				If (vButtDisO="O@")
					vButtDisO:=Substring:C12(vButtDisO; 1; 15)+" "+Substring:C12(vButtDisO; 17; 99)
				End if 
			End if 
		Else 
			vButtDisO:=Substring:C12(vButtDisO; 1; 4)+"MONP"+Substring:C12(vButtDisO; 9; 99)
			If (Substring:C12(vButtDisO; 16; 1)="D")
				If (vButtDisO="O@")
					vButtDisO:=Substring:C12(vButtDisO; 1; 15)+" "+Substring:C12(vButtDisO; 17; 99)
				End if 
			End if 
	End case 
	DB_t_CallOnCloseorSave:=""
	vFromIn:=False:C215
	$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; 0; "noGreybuttons"; False:C215)
	SYS_GetCurrentUserSetting($_Obj_GetUser)
	If (<>ButtDis#vButtDisO)
		If (vProc=Frontmost process:C327(*))
			<>ButtDis:=vButtDisO
			If ($_Obj_GetUser.noGreybuttons=False:C215) | (True:C214)
				If (<>ButtProc>0)
					ARRAY TEXT:C222($_at_PalPopup5; 0)
					VARIABLE TO VARIABLE:C635(<>ButtProc; PAL_at_PopUpMenu5; $_at_PalPopup5)
					POST OUTSIDE CALL:C329(<>ButtProc)
				End if 
			End if 
		End if 
	End if 
	If (<>RecBarUp#0)
		Macro_FileUpd
	End if 
End if 
If (Current process:C322=Frontmost process:C327(*))
	
	If (WIN_t_CurrentOutputform#"Superdiary") & (WIN_t_CurrentOutputform#"diary")
		//Out_SetManger
		QV_HideQualities
	Else 
		//In_SetManager
	End if 
End if 
ERR_MethodTrackerReturn("Out_Buttons"; $_t_oldMethodName)
