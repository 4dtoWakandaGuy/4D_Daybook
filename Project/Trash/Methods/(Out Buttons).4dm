//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Out Buttons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Out Buttons`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(<>BUTTPROC; <>InButtProc; <>PER_l_AccessLevel; <>RecBarUp; <>SCPT_l_PaletteWIndow; $Bar; DB_l_ButtonClickedFunction; iCancel; iOK; oOK; MOD_l_CurrentModuleAccess)
	C_LONGINT:C283(vButt)
	C_TEXT:C284(<>ButtDis; $_t_oldMethodName; DB_t_ButtonClickedFunction; vButtDis; vButtDisApp; vButtDisBk; vButtDisCom; vButtDisCon; vButtDisDry; vButtDisInv; vButtDisJob)
	C_TEXT:C284(vButtDisMov; vButtDisO; vButtDisOI; vButtDisOrd; vButtDisPro; vButtDisSC; vButtDisTxt; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Out Buttons")
//Out Buttons
//this method is called at the start of displaying every output layout
//it sets the button string and calls the button bar to update it
//i have also added in a call to the Selection manager
//and now a call to the cache manager


If (oOK=1)
	CANCEL:C270
Else 
	Case of 
		: ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print"))
			vButtDisO:=Substring:C12(vButtDisO; 1; 2)+"DPMONP"+Substring:C12(vButtDisO; 9; 4)+"R"+Substring:C12(vButtDisO; 14; 1)+"ADT"
		: (MOD_l_CurrentModuleAccess>2)
			If (MOD_l_CurrentModuleAccess=3)
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
	
	If (<>SCPT_l_PaletteWIndow#0)
		//Macro_FileUpd
	End if 
End if 
If (Current process:C322=Frontmost process:C327(*))
	
	If (WIN_t_CurrentOutputform#"Superdiary") & (WIN_t_CurrentOutputform#"diary")
		Out_SetManger
		QV_HideQualities
	Else 
		In_SetManager
	End if 
End if 
ERR_MethodTrackerReturn("Out Buttons"; $_t_oldMethodName)