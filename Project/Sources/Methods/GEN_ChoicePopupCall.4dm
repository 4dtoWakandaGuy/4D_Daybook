//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_ChoicePopupCall
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305($0; $3; Gen_bo_Create; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop; $10; $7; $8; $9; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $4; $5; $6; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_ChoicePopupCall")
//pass this method the following parameters


$0:=False:C215
If (Count parameters:C259>=2)
	ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
	ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
	ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274($1->))
	For ($_l_Index; 1; Size of array:C274($1->))
		//GEN_at_DropDownMenu{$_l_Index}:=Substring($1->{$_l_Index};1;55)
	End for 
	If (Count parameters:C259>=3)
		GEN_Bo_ShowCreate:=$3
	Else 
		GEN_Bo_ShowCreate:=False:C215
	End if 
	If (Count parameters:C259>=4)
		DB_t_WindowTitle:=$4
	Else 
		DB_t_WindowTitle:="Select Option"
	End if 
	If (Count parameters:C259>=5)
		GEN_t_OKText:=$5
	Else 
		GEN_t_OKText:=""
	End if 
	If (Count parameters:C259>=6)
		GEN_t_CancelText:=$6
	Else 
		GEN_t_CancelText:=""
	End if 
	If (Count parameters:C259>=10)
		$_l_OLeft:=$7
		$_l_OTop:=$8
		$_l_ORight:=$9
		$_l_OBottom:=$10
	Else 
		$_l_OLeft:=Screen width:C187/2
		$_l_OTop:=Screen height:C188/2
		$_l_ORight:=Screen width:C187/2
		$_l_OBottom:=Screen height:C188/2
		
	End if 
	GEN_at_DropDownMenu:=0
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153($_l_OLeft; $_l_OTop; $_l_OLeft; $_l_OTop; 1986)
	
	DIALOG:C40([USER:15]; "Gen_PopUpChoice")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	$0:=Gen_bo_Create
	$2->:=GEN_at_DropDownMenu
End if 
ERR_MethodTrackerReturn("GEN_ChoicePopupCall"; $_t_oldMethodName)
