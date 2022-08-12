//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_BuildGrouping
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
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	C_BOOLEAN:C305($_bo_OpenWindow; $_bo_SessionWindowOwner; QV_bo_ReturnQuals; SM_bo_SessionWindow)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Mode; $_l_QueryID; $_l_TableNumber; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; QV_l_CurrentTable; SM_l_QueryMode)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; $2; QV_t_DefaultGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_BuildGrouping")
//this method will display the  qualities groups window

If (Count parameters:C259>=2)
	QV_t_DefaultGroup:=$2
Else 
	QV_t_DefaultGroup:=""
End if 

$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
If (Count parameters:C259>=1)
	$_bo_OpenWindow:=False:C215
	$_l_TableNumber:=Table:C252(->[INFORMATION:55])
	QV_bo_ReturnQuals:=False:C215
	QV_l_CurrentTable:=$1
	//Note with qualities there can only be one search as it searches multiple values
	//so subsequent searches would drop back to the calling search
	$_l_QueryID:=0
	$_l_Mode:=0
	
	
	
	SM_l_QueryMode:=0
	
	ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
	ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
	$_bo_OpenWindow:=False:C215
	
	If (Not:C34(SM_bo_SessionWindow))
		SM_bo_SessionWindow:=True:C214
		$_bo_SessionWindowOwner:=True:C214
		
		$_bo_OpenWindow:=True:C214
		
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1990)
	Else 
		GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
		$_t_WindowTitleOLD:=Get window title:C450
		
		If ($_bo_SessionWindowOwner)
			$_bo_OpenWindow:=True:C214
		End if 
		SET WINDOW TITLE:C213("Build Qualitative Groups")
	End if 
	
	DIALOG:C40([USER:15]; "QV_Groupings")
	
	If (Not:C34($_bo_OpenWindow))
		SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
		SET WINDOW TITLE:C213($_t_WindowTitleOLD)
	End if 
	//``
	
	
	//```
	
	
	
	
	
End if 
If ($_bo_OpenWindow)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	SM_bo_SessionWindow:=False:C215
End if 
ERR_MethodTrackerReturn("QV_BuildGrouping"; $_t_oldMethodName)
