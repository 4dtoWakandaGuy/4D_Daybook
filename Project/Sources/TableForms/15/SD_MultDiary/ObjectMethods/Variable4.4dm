If (False:C215)
	//object Name: [USER]SD_MultDiary.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_Persons;0)
	C_BOOLEAN:C305(SD_bExpand; SD_bo_viewExpand)
	C_LONGINT:C283($_l_HLHeight; $_l_NewObjectBottom; $_l_NewObjectTop; $_l_NewWindowBottom; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_prevObjectRight; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; bExpandView; SD_HL_aDiaries; SD_l_CollapsedHeight)
	C_PICTURE:C286(SD_Pi_View)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD_MultDiary.Variable4"; Form event code:C388)
$_l_HLHeight:=108
If (Not:C34(SD_bo_viewExpand))
	//expand
	SD_bExpand:=True:C214
	SD_bo_viewExpand:=True:C214
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	SD_l_CollapsedHeight:=($_l_WindowBottom-$_l_windowTop)
	$_l_NewWindowBottom:=$_l_WindowBottom
	If (Screen height:C188>($_l_WindowBottom+108))
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom+108)
		$_l_NewWindowBottom:=$_l_WindowBottom+108
	End if 
	OBJECT SET VISIBLE:C603(SD_HL_aDiaries; True:C214)
	OBJECT MOVE:C664(SD_HL_aDiaries; 2; (($_l_NewWindowBottom-$_l_windowTop)-5)-$_l_HLHeight; ($_l_WindowRight-$_l_WindowLeft)-2; (($_l_NewWindowBottom-$_l_windowTop)-5); *)
	OBJECT GET COORDINATES:C663(SD_Pi_View; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_NewObjectTop:=(((($_l_NewWindowBottom-$_l_windowTop)-5)-$_l_HLHeight)-28)-5
	OBJECT MOVE:C664(SD_Pi_View; $_l_ObjectLeft+4; $_l_NewObjectTop; $_l_ObjectLeft+15+4; 28+$_l_NewObjectTop; *)
	OBJECT MOVE:C664(bExpandView; $_l_ObjectLeft+4; $_l_NewObjectTop; $_l_ObjectLeft+15+4; 28+$_l_NewObjectTop; *)
	//GET PICTURE FROM LIBRARY(15518+(Num(SD_bo_viewExpand)); SD_Pi_View)
	SD_Pi_View:=Get_Picture(15518+(Num:C11(SD_bo_viewExpand)))
	
	$_l_NewObjectBottom:=$_l_NewObjectTop-5
	OBJECT GET COORDINATES:C663(SD2_lb_Persons; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_prevObjectRight:=$_l_ObjectLeft
	OBJECT MOVE:C664(SD2_lb_Persons; $_l_ObjectLeft; 2; ($_l_WindowRight-$_l_WindowLeft)-2; $_l_NewObjectBottom; *)
	
	
	
	
Else 
	//collapse
	SD_bExpand:=True:C214
	SD_bo_viewExpand:=False:C215
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_windowTop+SD_l_CollapsedHeight)
	$_l_NewWindowBottom:=$_l_windowTop+SD_l_CollapsedHeight
	
	OBJECT GET COORDINATES:C663(SD_Pi_View; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_NewObjectTop:=((($_l_NewWindowBottom-$_l_windowTop)-5)-15)
	OBJECT MOVE:C664(SD_Pi_View; $_l_ObjectLeft-4; $_l_NewObjectTop; $_l_ObjectLeft+28-4; 15+$_l_NewObjectTop; *)
	OBJECT MOVE:C664(bExpandView; $_l_ObjectLeft-4; $_l_NewObjectTop; $_l_ObjectLeft+28-4; 15+$_l_NewObjectTop; *)
	//GET PICTURE FROM LIBRARY(15518+(Num(SD_bo_viewExpand)); SD_Pi_View)
	SD_Pi_View:=Get_Picture(15518+(Num:C11(SD_bo_viewExpand)))
	$_l_NewObjectBottom:=$_l_NewObjectTop-5
	OBJECT GET COORDINATES:C663(SD2_lb_Persons; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_prevObjectRight:=$_l_ObjectLeft
	OBJECT MOVE:C664(SD2_lb_Persons; $_l_ObjectLeft; 2; ($_l_WindowRight-$_l_WindowLeft)-2; $_l_NewObjectBottom; *)
	GOTO OBJECT:C206(SD2_lb_Persons)
	
	OBJECT SET VISIBLE:C603(SD_HL_aDiaries; False:C215)
	OBJECT MOVE:C664(SD_HL_aDiaries; 2; $_l_NewWindowBottom+15; ($_l_WindowRight-$_l_WindowLeft)-2; $_l_NewWindowBottom+5; *)
	
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD_MultDiary.Variable4"; $_t_oldMethodName)
