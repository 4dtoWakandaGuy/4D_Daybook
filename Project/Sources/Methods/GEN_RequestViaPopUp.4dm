//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_RequestViaPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/03/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(Gen_al_PopUPID;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(Gen_at_PopUp;0)
	C_BOOLEAN:C305($4; Gen_bo_Create; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Element; $_l_Index; $0; $8; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_DefaultValue)
	C_POINTER:C301($1; $2; $5)
	C_TEXT:C284($_t_oldMethodName; $3; $6; $7; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_RequestViaPopUp")
//TRACE
If (Count parameters:C259>=2)
	ARRAY TEXT:C222(Gen_at_PopUp; 0)
	ARRAY LONGINT:C221(Gen_al_PopUPID; 0)
	$_l_Element:=1
	For ($_l_Index; 1; Size of array:C274($1->))
		APPEND TO ARRAY:C911(Gen_at_PopUp; $1->{$_l_Index})
		
		
		If (Type:C295($2->)=Integer array:K8:18) | (Type:C295($2->)=LongInt array:K8:19)
			
			APPEND TO ARRAY:C911(Gen_al_PopUPID; $2->{$_l_Index})
		Else 
			APPEND TO ARRAY:C911(Gen_al_PopUPID; $_l_Element)
			$_l_Element:=$_l_Element+1
		End if 
	End for 
	DB_t_WindowTitle:=$3
	If (Count parameters:C259>=4)
		
		GEN_Bo_ShowCreate:=$4
	Else 
		GEN_Bo_ShowCreate:=False:C215
	End if 
	If (Count parameters:C259>=6)
		GEN_t_CancelText:=$6
	End if 
	If (Count parameters:C259>=7)
		GEN_t_OKText:=$7
	End if 
	If (Count parameters:C259>=8)
		WS_l_DefaultValue:=$8
	End if 
	//`The next lines are temp until I update the form
	
	ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
	ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
	COPY ARRAY:C226(Gen_at_PopUp; GEN_at_DropDownMenu)
	COPY ARRAY:C226(Gen_al_PopUPID; GEN_al_DropDownMenuID)
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
	DIALOG:C40([USER:15]; "Gen_PopUpChoice")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (Count parameters:C259>=5)
		$5->:=Gen_bo_Create
	End if 
	$0:=GEN_at_DropDownMenu
End if 
OK:=1
ERR_MethodTrackerReturn("GEN_RequestViaPopUp"; $_t_oldMethodName)