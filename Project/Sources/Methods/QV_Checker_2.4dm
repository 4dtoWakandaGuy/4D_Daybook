//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_Checker_2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_QualityIDS; 0)
	C_LONGINT:C283($_l_CountRecords; $_l_GroupID; $_l_Index; $_l_LastQuality; $_l_QualityIndex; $_l_QualListID; $_l_Sublist; QV_l_GROUPID)
	C_TEXT:C284($_t_oldMethodName; QV_GroupListItemSTR; QV_t_GroupListItemSTR2; QV_t_GroupListItemSTR3; QV_GroupListItemSTR4; QV_al_ListItemsTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_Checker_2")
Open window:C153(20; 20; 200; 100; -1984)
QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="Qualities")
$_l_QualListID:=[X_LISTS:111]x_ID:1
READ WRITE:C146([INFORMATION:55])
ALL RECORDS:C47([INFORMATION:55])
READ WRITE:C146([LIST_ITEMS:95])
READ WRITE:C146([X_LISTS:111])
ARRAY LONGINT:C221($_al_QualityIDS; 0)
SELECTION TO ARRAY:C260([INFORMATION:55]QualityID:14; $_al_QualityIDS)
$_l_LastQuality:=0
SORT ARRAY:C229($_al_QualityIDS)

For ($_l_QualityIndex; 1; Size of array:C274($_al_QualityIDS))
	
	If ($_l_LastQuality#$_al_QualityIDS{$_l_QualityIndex})
		$_l_LastQuality:=$_al_QualityIDS{$_l_QualityIndex}
		ERASE WINDOW:C160
		MESSAGE:C88(String:C10($_l_QualityIndex))
		MESSAGE:C88([INFORMATION:55]SubGroup:6)
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=$_al_QualityIDS{$_l_QualityIndex})
		QUERY SELECTION BY FORMULA:C207([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15#QV_WhatGroup([INFORMATION:55]QualityID:14; $_l_QualListID))
		
		$_l_CountRecords:=Records in selection:C76([INFORMATION:55])
		For ($_l_Index; 1; Records in selection:C76([INFORMATION:55]))
			
			MESSAGE:C88([INFORMATION:55]SubGroup:6+" "+String:C10(Records in selection:C76([INFORMATION:55])))
			
			
			
			
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
						QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$_l_QualListID; *)
						QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_Item_Status:7=0)
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
			If (QV_GroupListItemSTR4="WRONG GROUP")
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=QV_t_GroupListItemSTR2; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$_l_QualListID; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_Item_Status:7=0)
				
				$_l_GroupID:=[LIST_ITEMS:95]X_ID:3
				If (Records in selection:C76([LIST_ITEMS:95])>0)
					$_l_Sublist:=0
					AA_GetListItemProperty("SUBLIST"; ->$_l_Sublist)
					
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
					If ([LIST_ITEMS:95]X_ListID:4=$_l_Sublist)  //then the Group id on the quality is definetly wrong
						[INFORMATION:55]QualityGroupID:15:=$_l_GroupID
						DB_SaveRecord(->[INFORMATION:55])
						AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
					End if 
				Else 
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=[INFORMATION:55]Group:2; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$_l_QualListID; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_Item_Status:7=0)
					$_l_GroupID:=[LIST_ITEMS:95]X_ID:3
					If (Records in selection:C76([LIST_ITEMS:95])>0)
						$_l_Sublist:=0
						AA_GetListItemProperty("SUBLIST"; ->$_l_Sublist)
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
						If ([LIST_ITEMS:95]X_ListID:4#$_l_Sublist)
							[LIST_ITEMS:95]X_ListID:4:=$_l_Sublist
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						Else 
							//its the xlist name that is wrong
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_Sublist)
							[X_LISTS:111]x_ListName:2:=[INFORMATION:55]Group:2
							DB_SaveRecord(->[X_LISTS:111])
							AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
							
						End if 
						
					End if 
					
				End if 
				
				
			End if 
			NEXT RECORD:C51([INFORMATION:55])
		End for 
	End if 
	
End for 
ERR_MethodTrackerReturn("QV_Checker_2"; $_t_oldMethodName)
