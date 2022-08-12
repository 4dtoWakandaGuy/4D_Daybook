//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_QualitiesPalletteProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($3; QV_bo_AddAllowed)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ScreenWIdth; $1; $2; QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $4; QV_t_SetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_QualitiesPalletteProcess")

If (Count parameters:C259>=2)
	//MESSAGE("Setting QV_l_SelectedOwnerID from QV_QualitiesPalletteProcess to "+String($1))
	
	QV_l_SelectedOwnerID:=$1
	QV_l_SelectedOwnerTableID:=$2
	If (Count parameters:C259>=3)
		QV_bo_AddAllowed:=$3
	End if 
	If (Count parameters:C259>=4)
		QV_t_SetName:=$4
	End if 
	
	If (Count parameters:C259>=5)
		$_l_ScreenWIdth:=Screen width:C187
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenWIdth-290; 40; $_l_ScreenWIdth; 42; -(1984+2+4); "Information"; "QV_CloseWIndow")
	Else 
		$_l_ScreenWIdth:=Screen width:C187
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenWIdth-290; 40; $_l_ScreenWIdth; 42; -(1984+2+4); "information"; "QV_CloseWIndow")
	End if 
	
	DIALOG:C40([USER:15]; "Qualities_Pallette")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
ERR_MethodTrackerReturn("QV_QualitiesPalletteProcess"; $_t_oldMethodName)
