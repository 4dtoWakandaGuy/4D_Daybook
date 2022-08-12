If (False:C215)
	//Table Form Method Name: Object Name:      [DIARY].ContactNote
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2013 20:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_DiaryFieldNumber;0)
	//ARRAY LONGINT(SD2_al_RelationshipFields;0)
	//ARRAY LONGINT(SD2_al_RelationshipTables;0)
	//ARRAY TEXT(SD2_at_RelationshipCodes;0)
	//ARRAY TEXT(SD2_at_RelationShipSelector;0)
	//ARRAY TEXT(SD3_at_ResultCodes;0)
	//ARRAY TEXT(SD3_at_resultNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD2_bo_LoadRelationsFromArray)
	C_DATE:C307(SD2_D_NoteEntryDate)
	C_LONGINT:C283($_l_Bottom; $_l_Bottom2; $_l_EndofLinePosition; $_l_event; $_l_Height; $_l_HeightNeeded; $_l_Index; $_l_LabelBottom; $_l_LabelLeft; $_l_LabelRight; $_l_LabelTop)
	C_LONGINT:C283($_l_Left; $_l_Left2; $_l_MaxLineLength; $_l_NextObjectTop; $_l_NumberOfCarriageReturns; $_l_NumberOfSoftReturns; $_l_ParseLinesIndex; $_l_RelationshipRow; $_l_Right; $_l_Right2; $_l_Top)
	C_LONGINT:C283($_l_Top2; $_l_Width)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_ContactName; $_t_NoteDetails; $_t_oldMethodName; $_t_RelationshipName; $_t_ThisLIne; SD2_t_NoteAttachedto; SD2_t_NoteDetails; SD2_t_NoteLabel; SD2_t_NoteResult)
	C_TIME:C306(SD2_ti_NoteEntryTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].ContactNote"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SD2_LoadDiary("ContactNote")
		
		
		If (SD2_bo_LoadRelationsFromArray)
			//Related records are in an array-this will only be on adding a new record
			For ($_l_Index; 1; Size of array:C274(SD2_al_RelationshipFields))
				If (SD2_al_RelationshipFields{$_l_Index}>0)
					$_t_RelationshipName:=SD2_GetRelationshipname(SD2_al_RelationshipTables{$_l_Index}; SD2_al_RelationshipFields{$_l_Index})
					If ($_t_RelationshipName#"")
						$_l_RelationshipRow:=Find in array:C230(SD2_at_RelationShipSelector; $_t_RelationshipName)
						If ($_l_RelationshipRow>0)
							If (SD2_al_DiaryFieldNumber{$_l_RelationshipRow}#0)
								$_ptr_Field:=Field:C253(Table:C252(->[DIARY:12]); SD2_al_DiaryFieldNumber{$_l_RelationshipRow})
								$_ptr_Field->:=SD2_at_RelationshipCodes{$_l_Index}
							Else 
								//not a field in the diary
								
							End if 
						End if 
					End if 
				End if 
			End for 
			
		End if 
		SD2_bo_LoadRelationsFromArray:=False:C215
		
		
		SD2_D_NoteEntryDate:=!00-00-00!
		SD2_ti_NoteEntryTime:=?00:00:00?
		Case of 
			: ([DIARY:12]Company_Code:1#"")
				If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)
					SD2_t_NoteAttachedto:=SD2_GETDIARYCOMPANY
					
				Else 
					SD2_t_NoteAttachedto:=[COMPANIES:2]Company_Name:2
				End if 
				If (SD2_t_NoteAttachedto#"")
					OBJECT SET ENTERABLE:C238(SD2_t_NoteAttachedto; False:C215)
				End if 
				
				$_t_ContactName:=""
				If ([DIARY:12]Contact_Code:2#"")
					If ([CONTACTS:1]Contact_Code:2#[DIARY:12]Contact_Code:2)
						$_t_ContactName:=DIA_GetContactname
						
					Else 
						$_t_ContactName:=[CONTACTS:1]Contact_Name:31
					End if 
					If ($_t_ContactName#"")
						If (SD2_t_NoteAttachedto#"")
							SD2_t_NoteAttachedto:=SD2_t_NoteAttachedto+" ("+$_t_ContactName+")"
						Else 
							SD2_t_NoteAttachedto:=$_t_ContactName
						End if 
					End if 
				End if 
				SD2_t_NoteLabel:="Contact"
			: ([DIARY:12]Contact_Code:2#"")
			: ([DIARY:12]Booking_Code:27#"")
			: ([DIARY:12]Call_Code:25#"")
			: ([DIARY:12]Document_Code:15#"")
			: ([DIARY:12]Event_Code:18#"")
			: ([DIARY:12]Job_Code:19#"")
			: ([DIARY:12]Order_Code:26#"")
			: ([DIARY:12]Product_Code:13#"")
				
		End case 
		If ([DIARY:12]Date_Do_From:4#!00-00-00!)
			SD2_D_NoteEntryDate:=[DIARY:12]Date_Do_From:4
		Else 
			SD2_D_NoteEntryDate:=Current date:C33(*)
		End if 
		If ([DIARY:12]Time_Do_From:6#?00:00:00?)
			SD2_ti_NoteEntryTime:=[DIARY:12]Time_Do_From:6
		Else 
			SD2_ti_NoteEntryTime:=Current time:C178(*)
		End if 
		If ([DIARY:12]Result_Description:12#"")
			SD2_t_NoteDetails:=[DIARY:12]Result_Description:12
		Else 
			SD2_t_NoteDetails:=[DIARY:12]Action_Details:10
		End if 
		$_l_NumberOfCarriageReturns:=STR_CountStr(SD2_t_NoteDetails; Char:C90(13))
		$_l_NumberOfSoftReturns:=STR_CountStr(SD2_t_NoteDetails; Char:C90(10))
		If (Length:C16(SD2_t_NoteDetails)>100) | ($_l_NumberOfCarriageReturns>4) | (True:C214)
			$_l_MaxLineLength:=70
			If ($_l_NumberOfCarriageReturns>0)
				
				$_t_NoteDetails:=SD2_t_NoteDetails
				For ($_l_ParseLinesIndex; 1; $_l_NumberOfCarriageReturns)
					
					$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_NoteDetails)
					If ($_l_EndofLinePosition>0)
						$_t_ThisLIne:=Substring:C12($_t_NoteDetails; 1; $_l_EndofLinePosition-1)
						$_t_NoteDetails:=Substring:C12($_t_NoteDetails; $_l_EndofLinePosition+1; Length:C16($_t_NoteDetails))
						
						Repeat 
							If (Length:C16($_t_ThisLIne)>$_l_MaxLineLength)
								$_l_NumberOfCarriageReturns:=$_l_NumberOfCarriageReturns+1
								$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_MaxLineLength+1; Length:C16($_t_ThisLIne))
							Else 
								$_t_ThisLIne:=""
								
							End if 
							
						Until (Length:C16($_t_ThisLIne)=0)
						
					End if 
				End for 
				If (Length:C16($_t_NoteDetails)>0)
					Repeat 
						If (Length:C16($_t_NoteDetails)>$_l_MaxLineLength)
							$_l_NumberOfCarriageReturns:=$_l_NumberOfCarriageReturns+1
							$_t_NoteDetails:=Substring:C12($_t_NoteDetails; $_l_MaxLineLength+1; Length:C16($_t_NoteDetails))
						Else 
							$_t_NoteDetails:=""
							
						End if 
						
					Until (Length:C16($_t_NoteDetails)=0)
					
				End if 
				
			Else 
				//no carriage returns
				$_l_NumberOfCarriageReturns:=Length:C16(SD2_t_NoteDetails)/35
			End if 
			
			//SET VISIBLE(SD2_t_NoteDetailsBigMessage;True)
			$_l_HeightNeeded:=($_l_NumberOfCarriageReturns*20)+12
			If ($_l_HeightNeeded<150)  //This height is for the object
				$_l_HeightNeeded:=150
			End if 
			
			OBJECT GET COORDINATES:C663(*; "oNotesDetails"; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
			If ([DIARY:12]Action_Code:9="")
				OBJECT SET VISIBLE:C603(*; "oAction@"; True:C214)
				OBJECT MOVE:C664(*; "oNotesDetails"; $_l_Left; $_l_Top+26; $_l_Right; $_l_Bottom; *)
				OBJECT GET COORDINATES:C663(*; "OdetailsLabel"; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Bottom2)
				OBJECT MOVE:C664(*; "OdetailsLabel"; $_l_Left2; $_l_Top2+26; $_l_Right2; $_l_Bottom2+26; *)
			Else 
				OBJECT SET VISIBLE:C603(*; "oAction@"; False:C215)
			End if 
			If ([DIARY:12]Result_Code:11="")
				$_l_HeightNeeded:=$_l_HeightNeeded+19+10
			End if 
			WS_AutoscreenSize(3; 240+($_l_HeightNeeded-150); 545)
			$_l_Height:=240+($_l_HeightNeeded-150)
			$_l_Width:=545
			
		Else 
			If ([DIARY:12]Result_Code:11="")
				$_l_HeightNeeded:=10
			End if 
			
			WS_AutoscreenSize(3; 240+$_l_HeightNeeded; 545)
			$_l_Height:=240
			$_l_Width:=545
			
		End if 
		
		If ([DIARY:12]Result_Code:11="")
			//get the results available for this action.
			SD2_t_NoteResult:=""
			ARRAY TEXT:C222(SD3_at_resultNames; 0)
			ARRAY TEXT:C222(SD3_at_ResultCodes; 0)
			
			SD3_GetAvailableResults([DIARY:12]Action_Code:9; ->[DIARY:12]Attributes:79; ->SD3_at_ResultCodes; ->SD3_at_resultNames)
			OBJECT SET VISIBLE:C603(*; "oResultsPopup"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oResult"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oResultLabel"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oNotesDetails"; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
			OBJECT GET COORDINATES:C663(*; "oActionLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
			$_l_NextObjectTop:=$_l_Bottom+5
			OBJECT SET COORDINATES:C1248(*; "oResultLabel"; $_l_LabelLeft; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oResultsPopup"; $_l_Left-1; $_l_NextObjectTop-2; $_l_Left+202; $_l_NextObjectTop+18)
			OBJECT SET COORDINATES:C1248(*; "oResult"; $_l_Left; $_l_NextObjectTop; $_l_Left+181; $_l_NextObjectTop+14)
		Else 
			OBJECT SET VISIBLE:C603(*; "oResultsPopup"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oResult"; True:C214)
			QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
			SD2_t_NoteResult:=[RESULTS:14]Result_Name:2
			UNLOAD RECORD:C212([RESULTS:14])
			OBJECT SET VISIBLE:C603(*; "oResultLabel"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oNotesDetails"; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
			$_l_NextObjectTop:=$_l_Bottom+5
			OBJECT GET COORDINATES:C663(*; "oActionLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
			OBJECT SET COORDINATES:C1248(*; "oResultLabel"; $_l_LabelLeft; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+14)
			
			OBJECT SET COORDINATES:C1248(*; "oResult"; $_l_Left; $_l_NextObjectTop; $_l_Left+181; $_l_NextObjectTop+14)
		End if 
		$_l_NextObjectTop:=$_l_NextObjectTop+19+5
		OBJECT GET COORDINATES:C663(*; "oCancelButton"; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
		OBJECT SET COORDINATES:C1248(*; "oCancelButton"; $_l_Left; $_l_NextObjectTop; $_l_Right; $_l_NextObjectTop+21)
		OBJECT GET COORDINATES:C663(*; "oSaveButton"; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
		OBJECT SET COORDINATES:C1248(*; "oSaveButton"; $_l_Left; $_l_NextObjectTop; $_l_Right; $_l_NextObjectTop+21)
		If (False:C215)
			//WS_AutoscreenSize (3;240+($_l_HeightNeeded-150);545)
			$_l_Height:=$_l_NextObjectTop+21+10+10
			$_l_Width:=545
			WS_AutoscreenSize(3; $_l_Height; $_l_Width)
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("FM [DIARY].ContactNote"; $_t_oldMethodName)
