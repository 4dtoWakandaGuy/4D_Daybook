//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Lists
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/02/2010 14:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SubSelectionID; 0)
	//ARRAY LONGINT(GEN_al_NameID;0)
	//ARRAY LONGINT(LM_al_ListIds;0)
	ARRAY TEXT:C222($_at_SubSelection; 0)
	//ARRAY TEXT(aLCS;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(LM_at_ListNames;0)
	C_BOOLEAN:C305(<>PER_bo_SystemSettingAccess; $_bo_Contains; $_bo_Insert; $_bo_Look; $_bo_StartsWIth; AA_bo_ListsInited; LB_bo_MinorFromLB)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_AccessNumber; $_l_AddMode; $_l_CharacterPosition; $_l_DockRight; $_l_Element; $_l_EntryRow; $_l_FieldNumber; $_l_Index; $_l_Index2; $_l_Index3)
	C_LONGINT:C283($_l_ListID; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_OK; $_l_RecordsInSelection; $_l_ScreenWidth; $_l_TableNumber; $_l_Type; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; AL_l_Bottom; AL_l_Left; AL_l_Right; AL_l_Top; vAdd; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNext)
	C_POINTER:C301($1)
	C_REAL:C285($4)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_Entry; $_t_ItemName; $_t_oldMethodName; $_t_VariableName; $2; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Lists")
//Check_Lists (->vType_;"Rate Types")   DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
//Check_Lists
If (False:C215)
	$_t_Entry:=$1->
	$_l_Type:=Type:C295($1->)
	If ($_t_Entry#"")
		If (Count parameters:C259=3)
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			COPY NAMED SELECTION:C331([LIST_ITEMS:95]; $3)
		End if 
		$_bo_Look:=False:C215
		If (($_l_Type=0) | ($_l_Type=2) | ($_l_Type=24))
			$_l_AddMode:=vAdd
			vAdd:=0
			$_t_Entry:=Check_QM($_t_Entry)
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_Entry)
			//QUERY([LIST_ITEMS]; & ;[LIST_ITEMS]List Entry=$_t_Entry)
			If (Records in selection:C76([X_LISTS:111])=0)
				If (Character code:C91(Substring:C12($_t_Entry; Length:C16($_t_Entry); 1))#64)
					$_t_Entry:=$_t_Entry+"@"
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_Entry)
					If (Records in selection:C76([X_LISTS:111])=0)
						If (<>PER_bo_SystemSettingAccess)
							vAdd:=1
						End if 
						QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_Entry)
						$_bo_Look:=True:C214
					End if 
				Else 
					If (<>PER_bo_SystemSettingAccess)
						vAdd:=1
					End if 
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_Entry)
					$_bo_Look:=True:C214
				End if 
			End if 
			OK:=1
			xNext:=0
			
			If ((Records in selection:C76([X_LISTS:111])#1) | ($_bo_Look))
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				If (<>PER_bo_SystemSettingAccess=False:C215)
					DB_t_CurrentFormUsage:="NC"
				End if 
				If (Records in selection:C76([X_LISTS:111])>1)
					//REDUCE SELECTION([LIST_ITEMS];250)
				End if 
				$_l_DockRight:=INT_GetDock("R")
				$_l_ScreenWidth:=(Screen width:C187-$_l_DockRight)
				WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenWidth-193; <>SYS_l_WindowTop+50; $_l_ScreenWidth; 282; 1988; $2+" List"; "Close_Cancel")
				$_l_RecordsInSelection:=Records in selection:C76([X_LISTS:111])
				Array_LCx($_l_RecordsInSelection)
				SELECTION TO ARRAY:C260([X_LISTS:111]x_ListName:2; GEN_at_Name)
				For ($_l_Index; 1; $_l_RecordsInSelection)
					GEN_at_RecordCode{$_l_Index}:=String:C10($_l_Index)
					GEN_at_Identity{$_l_Index}:=""
				End for 
				If (vAdd=1)
					If (Character code:C91(Substring:C12($_t_Entry; Length:C16($_t_Entry); 1))=64)
						$_t_Entry:=Substring:C12($_t_Entry; 1; Length:C16($_t_Entry)-1)
					End if 
					$_t_Entry:=Uppers2(RemoveTrail2($_t_Entry))
					vText:=$_t_Entry
				End if 
				DIALOG:C40([COMPANIES:2]; "dLists")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
				WS_KeepFocus
				
				If (OK=1)
					If (Count parameters:C259=3)
						USE NAMED SELECTION:C332($3)
					End if 
					$1->:=vText
					$1->:=RemoveTrail2($1->)
					DB_SaveRecord(->[LIST_ITEMS:95])
					AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				Else 
					If (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))=64)
						$1->:=Substring:C12($1->; 1; Length:C16($1->)-1)
					End if 
					$_l_Index:=Find in array:C230(GEN_at_Identity; "*")
					If ($_l_Index>1)
						Gen_Confirm("Do you want to Save the changes made to the Lists?"; "Save"; "Don't Save")
					End if 
				End if 
				If (OK=1)
					READ WRITE:C146([LIST_ITEMS:95])
					$_l_RecordsInSelection:=Size of array:C274(GEN_at_Name)
					For ($_l_Index; 1; $_l_RecordsInSelection)
						If (((GEN_at_Identity{$_l_Index}="*")) & (GEN_at_RecordCode{$_l_Index}#"") & (GEN_at_Name{$_l_Index}#""))
							GOTO SELECTED RECORD:C245([LIST_ITEMS:95]; Num:C11(GEN_at_RecordCode{$_l_Index}))
							[LIST_ITEMS:95]List_Entry:2:=GEN_at_Name{$_l_Index}
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						End if 
					End for 
					For ($_l_Index; 1; $_l_RecordsInSelection)
						If (((GEN_at_Identity{$_l_Index}="*") | ((GEN_at_Identity{$_l_Index}="+") & (GEN_at_Name=$_l_Index))) & (GEN_at_RecordCode{$_l_Index}="") & (GEN_at_Name{$_l_Index}#""))
							CREATE RECORD:C68([LIST_ITEMS:95])
							[LIST_ITEMS:95]List_Name:1:=$2
							[LIST_ITEMS:95]List_Entry:2:=GEN_at_Name{$_l_Index}
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						End if 
					End for 
					If (Count parameters:C259#3)
						READ ONLY:C145([LIST_ITEMS:95])
					End if 
				End if 
				If (Count parameters:C259#3)
					UNLOAD RECORD:C212([LIST_ITEMS:95])
				End if 
				Array_LCx(0)
				DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				If (Count parameters:C259=3)
					USE NAMED SELECTION:C332($3)
				End if 
			Else 
				vText:=[LIST_ITEMS:95]List_Entry:2
				If (Count parameters:C259=3)
					USE NAMED SELECTION:C332($3)
				End if 
				$1->:=vText
				$1->:=RemoveTrail2($1->)
			End if 
			vAdd:=$_l_AddMode
		End if 
		If (Count parameters:C259=3)
			CLEAR NAMED SELECTION:C333($3)
		End if 
	End if 
Else 
	//$1 may point at a field or a variable
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	If (LB_bo_MinorFromLB)
		$_l_ObjectLeft:=AL_l_Left
		$_l_ObjectTop:=AL_l_Top
		$_l_ObjectRight:=AL_l_Right
		$_l_ObjectBottom:=AL_l_Bottom
		LB_bo_MinorFromLB:=False:C215
	Else 
		OBJECT GET COORDINATES:C663($1->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	End if 
	
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	$_t_Entry:=$1->
	ARRAY LONGINT:C221(LM_al_ListIds; 0)
	ARRAY TEXT:C222(LM_at_ListNames; 0)
	If ($_t_VariableName="")
		If ($2="Lists")  //note that the designer will get more lists here than others
			AA_LoaduserVisibleListNames(->LM_al_ListIds; ->LM_at_ListNames)
			
		Else 
			$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FieldNumber; $2)
		End if 
	Else 
		$_l_ListID:=AA_GetListID(-1; -1; $2; $_t_VariableName)
	End if 
	$_l_AddMode:=vAdd
	vAdd:=0
	ARRAY TEXT:C222(aLCS; 0)
	ARRAY LONGINT:C221(GEN_al_NameID; 0)
	If ($2="Lists")  //user is to select a list
		$_l_ListID:=0
		For ($_l_Index; 1; Size of array:C274(LM_al_ListIds))
			APPEND TO ARRAY:C911(aLCS; LM_at_ListNames{$_l_Index})
			APPEND TO ARRAY:C911(GEN_al_NameID; LM_al_ListIds{$_l_Index})
		End for 
	Else 
		AA_LoadListbyID($_l_ListID; ->aLCS; ->GEN_al_NameID; False:C215)
	End if 
	If (False:C215)  //BSW 17/02/03 Engineering new reported error 61 so I am retyping these arrays
		
		// ARRAY STRING(255;GEN_at_Name;Size of array(aLCS))
	End if 
	
	ARRAY TEXT:C222(GEN_at_Name; Size of array:C274(aLCS))
	
	For ($_l_Index; 1; Size of array:C274(aLCS))
		GEN_at_Name{$_l_Index}:=aLCS{$_l_Index}
	End for 
	
	$_t_Entry:=Check_QM($_t_Entry)
	
	If ((Character code:C91(Substring:C12($_t_Entry; Length:C16($_t_Entry); 1))#64)) & ((Character code:C91(Substring:C12($_t_Entry; 1; 1))#64))
		$_l_EntryRow:=Find in array:C230(GEN_at_Name; $_t_Entry)
	Else 
		$_l_EntryRow:=-1
	End if 
	
	If ($_l_EntryRow<0)
		//have to build list of possibles
		$_bo_StartsWIth:=True:C214
		$_bo_Contains:=False:C215
		If ((Character code:C91(Substring:C12($_t_Entry; Length:C16($_t_Entry); 1))=64))
			$_t_Entry:=Substring:C12($_t_Entry; 1; Length:C16($_t_Entry)-1)
			$_bo_StartsWIth:=True:C214
		End if 
		If ($_t_Entry#"")
			If ((Character code:C91(Substring:C12($_t_Entry; 1; 1))=64))
				$_t_Entry:=Substring:C12($_t_Entry; 2; Length:C16($_t_Entry))
				$_bo_StartsWIth:=False:C215
				$_bo_Contains:=True:C214
			End if 
		End if 
		If ($_t_Entry#"")
			ARRAY TEXT:C222($_at_SubSelection; Size of array:C274(GEN_at_Name))
			ARRAY LONGINT:C221($_al_SubSelectionID; Size of array:C274(GEN_at_Name))
			$_l_Element:=0
			For ($_l_Index2; 1; Size of array:C274(GEN_at_Name))
				$_t_ItemName:=GEN_at_Name{$_l_Index2}
				$_l_CharacterPosition:=Position:C15($_t_Entry; $_t_ItemName)
				If ($_l_CharacterPosition>0)
					$_bo_Insert:=False:C215
					If ($_bo_Contains)
						$_bo_Insert:=True:C214
					Else 
						If ($_l_CharacterPosition=1)
							$_bo_Insert:=True:C214
						End if 
					End if 
					If ($_bo_Insert)
						$_l_Element:=$_l_Element+1
						$_at_SubSelection{$_l_Element}:=GEN_at_Name{$_l_Index2}
						$_al_SubSelectionID{$_l_Element}:=GEN_al_NameID{$_l_Index2}
					End if 
					
				End if 
			End for 
			If ($_l_Element>0)
				ARRAY TEXT:C222($_at_SubSelection; $_l_Element)
				ARRAY LONGINT:C221($_al_SubSelectionID; $_l_Element)
				
				Array_LCx($_l_Element)
				ARRAY LONGINT:C221(GEN_al_NameID; $_l_Element)
				For ($_l_Index3; 1; $_l_Element)
					GEN_at_RecordCode{$_l_Index3}:=String:C10($_l_Index3)
					GEN_at_Name{$_l_Index3}:=$_at_SubSelection{$_l_Index3}
					GEN_al_NameID{$_l_Index3}:=$_al_SubSelectionID{$_l_Index3}
				End for 
			Else 
				//no match so put em all in?
				$_l_Element:=Size of array:C274(GEN_at_Name)
				
				Array_LCx($_l_Element)  //current setup does not do that
				For ($_l_Index3; 1; $_l_Element)
					GEN_at_RecordCode{$_l_Index3}:=String:C10($_l_Index3)
					
				End for 
				
			End if 
		Else 
			//the entry must have been a wild card
			Array_LCx(Size of array:C274(GEN_at_Name))
		End if 
		
		If (Size of array:C274(GEN_at_RecordCode)>0) | (<>PER_bo_SystemSettingAccess)
			$_l_ScreenWidth:=Screen width:C187
			$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
			If (<>PER_bo_SystemSettingAccess)
				vAdd:=1
			Else 
				DB_t_CurrentFormUsage:="NC"
			End if 
			vText:=$_t_Entry
			WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			
			WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+$_l_ObjectLeft; $_l_windowTop+$_l_ObjectTop; ($_l_WindowLeft+$_l_ObjectLeft)+193; ($_l_windowTop+$_l_ObjectTop)+282; -722; $2+" List"; "Close_Cancel")
			DIALOG:C40([COMPANIES:2]; "dLists")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
			//`````````````
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			$_l_OK:=0
			If (OK=1)
				If (Count parameters:C259=3)
					USE NAMED SELECTION:C332($3)
				End if 
				$_l_Index:=Find in array:C230(GEN_at_Identity; "*")
				If ($_l_Index>=1)
					Gen_Confirm("Do you want to Save the changes made to the Lists?"; "Save"; "Don't Save")
					$_l_OK:=OK
				End if 
				
				$1->:=vText
				$1->:=RemoveTrail2($1->)
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			Else 
				If (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))=64)
					$1->:=Substring:C12($1->; 1; Length:C16($1->)-1)
				End if 
				$_l_OK:=0
			End if 
			If ($_l_OK=1)
				If ($2="Lists")
					READ WRITE:C146([X_LISTS:111])
					$_l_RecordsInSelection:=Size of array:C274(GEN_at_Name)
					For ($_l_Index; 1; $_l_RecordsInSelection)
						If (((GEN_at_Identity{$_l_Index}="*")) & (GEN_at_RecordCode{$_l_Index}="") & (GEN_at_Name{$_l_Index}#""))
							If (GEN_al_NameID{$_l_Index}#0)
								QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=GEN_al_NameID{$_l_Index})
								If (Records in selection:C76([X_LISTS:111])>0)
									GEN_at_RecordCode{$_l_Index}:=GEN_at_Name{$_l_Index}
									
									[X_LISTS:111]x_ListName:2:=GEN_at_Name{$_l_Index}
									DB_SaveRecord(->[X_LISTS:111])
									AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
									AA_bo_ListsInited:=False:C215
								End if 
							Else 
								CREATE RECORD:C68([X_LISTS:111])
								GEN_at_RecordCode{$_l_Index}:=GEN_at_Name{$_l_Index}
								[X_LISTS:111]x_ID:1:=AA_GetNextID(->[X_LISTS:111]x_ID:1)
								[X_LISTS:111]x_ListName:2:=GEN_at_Name{$_l_Index}
								$_l_AccessNumber:=0 ?+ 1
								
								AA_SetListProperty("ACCESS"; $_l_AccessNumber)
								DB_SaveRecord(->[X_LISTS:111])
								AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
								AA_bo_ListsInited:=False:C215
								
							End if 
						End if 
					End for 
				Else 
					READ WRITE:C146([LIST_ITEMS:95])
					$_l_RecordsInSelection:=Size of array:C274(GEN_at_Name)
					For ($_l_Index; 1; $_l_RecordsInSelection)
						If (((GEN_at_Identity{$_l_Index}="*")) & (GEN_at_RecordCode{$_l_Index}="") & (GEN_at_Name{$_l_Index}#""))
							If (GEN_al_NameID{$_l_Index}#0)
								QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=GEN_al_NameID{$_l_Index})
								If (Records in selection:C76([LIST_ITEMS:95])>0)
									GEN_at_RecordCode{$_l_Index}:=GEN_at_Name{$_l_Index}
									[LIST_ITEMS:95]List_Entry:2:=GEN_at_Name{$_l_Index}
									[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
									DB_SaveRecord(->[LIST_ITEMS:95])
									AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
								End if 
							Else 
								CREATE RECORD:C68([LIST_ITEMS:95])
								GEN_at_RecordCode{$_l_Index}:=GEN_at_Name{$_l_Index}
								[LIST_ITEMS:95]List_Entry:2:=GEN_at_Name{$_l_Index}
								[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
								DB_SaveRecord(->[LIST_ITEMS:95])
								AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
								
							End if 
						End if 
					End for 
					For ($_l_Index; 1; $_l_RecordsInSelection)
						If (((GEN_at_Identity{$_l_Index}="*") | ((GEN_at_Identity{$_l_Index}="+") & (GEN_at_Name=$_l_Index))) & (GEN_at_RecordCode{$_l_Index}="") & (GEN_at_Name{$_l_Index}#""))
							CREATE RECORD:C68([LIST_ITEMS:95])
							[LIST_ITEMS:95]List_Name:1:=$2
							[LIST_ITEMS:95]List_Entry:2:=GEN_at_Name{$_l_Index}
							[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						End if 
					End for 
					If (Count parameters:C259#3)
						READ ONLY:C145([LIST_ITEMS:95])
					End if 
				End if 
			End if 
			If (Count parameters:C259#3)
				UNLOAD RECORD:C212([LIST_ITEMS:95])
			End if 
			Array_LCx(0)
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			If (Count parameters:C259=3)
				USE NAMED SELECTION:C332($3)
			End if 
			
			
			//```````
		End if 
		
	Else 
		//entry found
		vText:=GEN_at_Name{$_l_EntryRow}
		If (Count parameters:C259=3)
			USE NAMED SELECTION:C332($3)
		End if 
		$1->:=vText
		$1->:=RemoveTrail2($1->)
	End if 
	vAdd:=$_l_AddMode
End if 
WS_KeepFocus
ERR_MethodTrackerReturn("Check_Lists"; $_t_oldMethodName)