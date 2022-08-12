If (False:C215)
	//Table Form Method Name: [INFORMATION]Group_Checker
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_GroupID; $_l_QualitiesListID; QV_l_GROUPID)
	C_TEXT:C284($_t_oldMethodName; QV_al_ListItemsTR; QV_GroupListItemSTR; QV_GroupListItemSTR4; QV_t_GroupListItemSTR2; QV_t_GroupListItemSTR3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INFORMATION].Group_Checker"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="Qualities")
		$_l_QualitiesListID:=[X_LISTS:111]x_ID:1
		QV_l_GROUPID:=0
		QV_GroupListItemSTR4:="RIGHT GROUP"
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
		If (Records in selection:C76([LIST_ITEMS:95])=0)
			QV_al_ListItemsTR:="ERROR"
		Else 
			QV_al_ListItemsTR:=[LIST_ITEMS:95]List_Entry:2
			$_l_GroupID:=[LIST_ITEMS:95]X_ListID:4
			If ($_l_GroupID>0)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_GroupID)
				If (Records in selection:C76([X_LISTS:111])=0)
					QV_t_GroupListItemSTR2:="ERROR"
					QV_t_GroupListItemSTR3:="ERROR"
				Else 
					QV_t_GroupListItemSTR2:=[X_LISTS:111]x_ListName:2
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=QV_t_GroupListItemSTR2; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$_l_QualitiesListID)
					If (Records in selection:C76([LIST_ITEMS:95])=0)
						QV_t_GroupListItemSTR3:="ERROR"
					Else 
						QV_t_GroupListItemSTR3:="QUALITIES"
						QV_l_GROUPID:=[LIST_ITEMS:95]X_ID:3
					End if 
				End if 
				
			Else 
				QV_t_GroupListItemSTR2:="ERROR"
				QV_t_GroupListItemSTR3:="ERROR"
			End if 
			
		End if 
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityGroupID:15)
		If (Records in selection:C76([LIST_ITEMS:95])=0)
			QV_GroupListItemSTR:="ERROR"
		Else 
			QV_GroupListItemSTR:=[LIST_ITEMS:95]List_Entry:2
			
		End if 
		If (QV_l_GROUPID#[INFORMATION:55]QualityGroupID:15)
			QV_GroupListItemSTR4:="WRONG GROUP"
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [INFORMATION].Group_Checker"; $_t_oldMethodName)
