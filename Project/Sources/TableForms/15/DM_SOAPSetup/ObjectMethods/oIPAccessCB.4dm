If (False:C215)
	//object Name: [USER]DM_SOAPSetup.oIPAccessCB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DM_at_IPAccess;0)
	C_BOOLEAN:C305(DM_bo_RestrictAccessIP; DM_bo_RestrictAccessPW)
	C_LONGINT:C283($_l_event; $_l_Height; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRIght; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2; DM_l_Badd; DM_l_BaddIP)
	C_LONGINT:C283(DM_l_Bdel; DM_l_BdelIP; DM_l_RestrictAccessIP; DM_l_RestrictAccessPW)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DM_SOAPSetup.oIPAccessCB"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		DM_bo_RestrictAccessIP:=(DM_l_RestrictAccessIP=1)
		If (DM_bo_RestrictAccessIP)
			
			OBJECT SET VISIBLE:C603(DM_at_IPAccess; True:C214)
			OBJECT SET VISIBLE:C603(DM_l_BdelIP; True:C214)
			OBJECT SET VISIBLE:C603(DM_l_BaddIP; True:C214)
			OBJECT GET COORDINATES:C663(DM_l_RestrictAccessPW; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
			$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT GET COORDINATES:C663(DM_l_BaddIP; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom)
			OBJECT MOVE:C664(DM_l_RestrictAccessIP; $_l_ObjectLeft; $_l_ObjectBottom+5; $_l_ObjectRIght; $_l_ObjectBottom+5+$_l_Height; *)
			$_l_ObjectTop:=$_l_ObjectBottom+5
			$_l_ObjectBottom:=$_l_ObjectBottom+5+$_l_Height
		Else 
			OBJECT SET VISIBLE:C603(DM_at_IPAccess; False:C215)
			OBJECT SET VISIBLE:C603(DM_l_BdelIP; False:C215)
			OBJECT SET VISIBLE:C603(DM_l_BaddIP; False:C215)
			OBJECT GET COORDINATES:C663(DM_l_RestrictAccessPW; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
			$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT GET COORDINATES:C663(DM_l_BaddIP; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom)
			OBJECT MOVE:C664(DM_l_RestrictAccessPW; $_l_ObjectLeft; $_l_ObjectBottom+5; $_l_ObjectRIght; $_l_ObjectBottom+5+$_l_Height; *)
			$_l_ObjectTop:=$_l_ObjectBottom+5
			$_l_ObjectBottom:=$_l_ObjectBottom+5+$_l_Height
		End if 
		If (DM_bo_RestrictAccessPW)
			OBJECT GET COORDINATES:C663(*; "oPWAccessSCROLL"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRIght; $_l_ObjectBottom)
			$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop2  // so we know where to stick the buttons
			OBJECT MOVE:C664(*; "oPWAccessSCROLL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectTop+$_l_Height; *)
			OBJECT GET COORDINATES:C663(DM_l_Bdel; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRIght; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(DM_l_Badd; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom)
			$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop2
			OBJECT MOVE:C664(DM_l_Bdel; $_l_ObjectLeft; $_l_ObjectTop+$_l_Height+10; $_l_ObjectRIght; $_l_ObjectTop+$_l_Height+10+$_l_Height; *)
			OBJECT MOVE:C664(DM_l_Badd; $_l_ObjectLeft2; $_l_ObjectTop+$_l_Height+10; $_l_ObjectRight2; $_l_ObjectTop+$_l_Height+10+$_l_Height; *)
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].DM_SOAPSetup.oIPAccessCB"; $_t_oldMethodName)
