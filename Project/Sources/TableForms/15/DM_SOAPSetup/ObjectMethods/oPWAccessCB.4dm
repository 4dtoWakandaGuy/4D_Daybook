If (False:C215)
	//object Name: [USER]DM_SOAPSetup.oPWAccessCB
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
	C_BOOLEAN:C305(DM_bo_RestrictAccessPW)
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; DM_l_Badd; DM_l_Bdel; DM_l_RestrictAccessPW)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DM_SOAPSetup.oPWAccessCB"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		DM_bo_RestrictAccessPW:=(DM_l_RestrictAccessPW=1)
		If (DM_bo_RestrictAccessPW)
			
			//Because we move the object DM_l_RestrictAccessPW if we enble the IP restriction we can now use this object to calculate the others
			OBJECT GET COORDINATES:C663(DM_l_RestrictAccessPW; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oPWAccessSCROLL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop  // so we know where to stick the buttons
			OBJECT MOVE:C664(*; "oPWAccessSCROLL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectTop+$_l_ObjectHeight; *)
			OBJECT GET COORDINATES:C663(DM_l_Bdel; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(DM_l_Badd; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom)
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			OBJECT MOVE:C664(DM_l_Bdel; $_l_ObjectLeft; $_l_ObjectTop+$_l_ObjectHeight+10; $_l_ObjectRight; $_l_ObjectTop+$_l_ObjectHeight+10+$_l_ObjectHeight; *)
			OBJECT MOVE:C664(DM_l_Badd; $_l_ObjectLeft2; $_l_ObjectTop+$_l_ObjectHeight+10; $_l_ObjectRight2; $_l_ObjectTop+$_l_ObjectHeight+10+$_l_ObjectHeight; *)
			
			
			OBJECT SET VISIBLE:C603(*; "oPWAccessSCROLL"; True:C214)  // Show the Scroll Bars
			OBJECT SET VISIBLE:C603(*; "oPWAccessb@"; True:C214)  // SHow the buttons
		Else 
			
			OBJECT SET VISIBLE:C603(*; "oPWAccessSCROLL"; False:C215)  // Hide the Scroll Bars
			OBJECT SET VISIBLE:C603(*; "oPWAccessb@"; False:C215)  // hide the buttons
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].DM_SOAPSetup.oPWAccessCB"; $_t_oldMethodName)
